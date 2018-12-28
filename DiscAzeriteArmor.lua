-- n is the addonTable
local addonName, n = ...

local GetItemInfo = GetItemInfo
local GetItemQualityColor = GetItemQualityColor

function DiscAzeriteArmor_GetSpellID(powerID)
	local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(powerID)
  	if (powerInfo) then
    	local azeriteSpellID = powerInfo["spellID"]
    	return azeriteSpellID
  	end
end

function DiscAzeriteArmor_GetBagPosition(itemLink)
    for bag = 0, NUM_BAG_SLOTS do
        for slot = 1, GetContainerNumSlots(bag) do
            if(GetContainerItemLink(bag, slot) == itemLink) then
                return bag, slot
            end
        end
    end
end

local OnTooltipSetItem = function(self, ...)
	local name, itemLink = self:GetItem()
	if itemLink then
		local _, _, quality, itemLevel, _, _, _, _, itemEquipLoc = GetItemInfo(itemLink)
		
		if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
			local specID = GetSpecializationInfo(GetSpecialization())
			local allTierInfo = C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(itemLink)
			if not allTierInfo then return end
			
			-- Create data source from item link and get the item
			local owningItemSource = AzeriteEmpoweredItemDataSource:CreateFromFromItemLink(itemLink);
			local sourceItem = owningItemSource:GetItem();
			if not sourceItem:IsItemDataCached() then
				-- We'll try again later
				return false;
			end
			
			local actualItemLocation = ItemLocation:CreateEmpty()
			
			-- Get the item location for the type of item (helm, shoulder, chest) and make sure it is an azerite item
			local equipmentSlot = sourceItem:GetInventoryType()
			-- For some reason there is a special "Robe" type that is not handled well so we need to remap that to "Chest"
			if equipmentSlot == 20 then
				equipmentSlot = 5
			end
			--print("InventoryType: "..equipmentSlot)
			local equippedItemLocation = ItemLocation:CreateFromEquipmentSlot(equipmentSlot);
			if not C_Item.DoesItemExist(equippedItemLocation) then
				--print("Could not find item in slot")
				return false
			end
			
			if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItem(equippedItemLocation) then
				--local equippedItemSource = AzeriteEmpoweredItemDataSource:CreateFromItemLocation(equippedItemLocation);
				-- If the equipped item is the one we are looking at, select the equipped item location
				if GetInventoryItemLink("player", equipmentSlot) == itemLink then
					--print("Setting location from equipped!")
					actualItemLocation = equippedItemLocation;
				else
					-- If the equipped location was not the item we are showing, find it in the bags
					local bag, slot = DiscAzeriteArmor_GetBagPosition(itemLink)
					if bag == nil or slot == nil then
						print("Error! Could not find item location!")
						return false
					end
					--print("Setting location from bag and slot!")
					actualItemLocation = ItemLocation:CreateFromBagAndSlot(bag, slot)
				end
			else
				-- If not azerite item equipped in slot, find it in the bags
				local bag, slot = DiscAzeriteArmor_GetBagPosition(itemLink)
				if bag == nil or slot == nil then
					print("Error! Could not find item location!")
					return false
				end
				--print("Setting location from bag and slot!")
				actualItemLocation = ItemLocation:CreateFromBagAndSlot(bag, slot)
			end
			
			-- Create some separation from other tooltip text
			self:AddLine(" ")
			local debugText = "Intellect from Azerite Powers:"
			self:AddLine(debugText)
			
			local selectedInt = 0
			local totalInt = 0
			
			for j=1, 3 do
				local tierInfo = allTierInfo[j];
				
				local highestTierInt = 0
				
				local azeritePowerID = tierInfo["azeritePowerIDs"][1]

				if azeritePowerID == 13 then break end -- Ignore +5 item level tier
				
				local azeriteTooltipText = " "
				
				for powerIndex, azeritePowerID in ipairs(tierInfo.azeritePowerIDs) do
					local azeriteSpellID = DiscAzeriteArmor_GetSpellID(azeritePowerID)				
					local azeritePowerName, _, icon = GetSpellInfo(azeriteSpellID)
					
					if C_AzeriteEmpoweredItem.IsPowerAvailableForSpec(azeritePowerID, specID) then
						local intValue = n.powerData[j][azeritePowerID] and n.powerData[j][azeritePowerID]["intValues"][itemLevel] or 0
						-- We get the highest value to present the total int of the item
						if intValue > highestTierInt then
							highestTierInt = intValue
						end
						
						-- Set color only for selected powers
						local nameColor = "777777"
						local intColor = "777777"
						if C_AzeriteEmpoweredItem.IsPowerSelected(actualItemLocation, azeritePowerID) then
							nameColor = "FFFFFF"
							intColor = "00FF00"
							selectedInt = selectedInt + intValue
						end
						
						azeriteTooltipText = azeriteTooltipText.." |cFF"..nameColor..azeritePowerName.." |cFF"..intColor.."+"..intValue.."|r"
					end			
				end
				
				totalInt = totalInt + highestTierInt
				self:AddLine(azeriteTooltipText)
			end
			
			local stats = GetItemStats(itemLink)
			
			self:AddLine("From Selected Powers: |cFF00FF00+"..selectedInt.." Intellect|r")
			self:AddLine("Optimal From Powers: |cFF00FF00+"..totalInt.." Intellect|r")
			self:AddLine("Total: |cFFFFFFFF+"..(stats["ITEM_MOD_INTELLECT_SHORT"] + selectedInt).." Intellect|r")
			self:AddLine("Optimal: |cFFFFFFFF+"..(stats["ITEM_MOD_INTELLECT_SHORT"] + totalInt).." Intellect|r")
			-- Create some spacing after
			self:AddLine(" ")
		end
	end
end

for _, obj in next, {
	GameTooltip,
	ShoppingTooltip1,
	ShoppingTooltip2,
	ShoppingTooltip3,
	ItemRefTooltip,
} do
	-- only show this for priest
	local _,_,classId = UnitClass("player")
	if classId == 5 then
		obj:HookScript("OnTooltipSetItem", OnTooltipSetItem)
	end
end

print("|cFF4863A0DiscAzeriteArmor 1.2-Beta loaded. Data updated December 24th.")
