local GetItemInfo = GetItemInfo
local GetItemQualityColor = GetItemQualityColor

local powerData = {
	[483] = {
		["name"] = "Archive of the Titans",
		["intValues"] = {
			[340] = 160,
			[345] = 160,
			[355] = 178,
			[360] = 196,
			[370] = 214,
			[375] = 214,
			[385] = 249,
			[390] = 249,
		}
	},
	[487] = {
		["name"] = "Retaliatory Fury",
		["intValues"] = {
			[340] = 148,
			[345] = 154,
			[355] = 169,
			[360] = 178,
			[370] = 195,
			[375] = 204,
			[385] = 224,
			[390] = 235,
		}
	},
	[195] = {
		["name"] = "Secrets of the Deep",
		["intValues"] = {
			[340] = 106,
			[345] = 111,
			[355] = 122,
			[360] = 128,
			[370] = 141,
			[375] = 148,
			[385] = 162,
			[390] = 170,
		}
	},
}

function DiscAzeriteArmor_GetSpellID(powerID)
	local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(powerID)
  	if (powerInfo) then
    	local azeriteSpellID = powerInfo["spellID"]
    	return azeriteSpellID
  	end
end

local OnTooltipSetItem = function(self, ...)
	local name, item = self:GetItem()
	if(item) then
		local _, _, quality, itemLevel, _, _, _, _, itemEquipLoc = GetItemInfo(item)
		
		if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(item) then
			local specID = GetSpecializationInfo(GetSpecialization())
			local allTierInfo = C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(item)
			
			local owningItemSource = AzeriteEmpoweredItemDataSource:CreateFromFromItemLink(item);
			local sourceItem = owningItemSource:GetItem();
			if not sourceItem:IsItemDataCached() then
				-- We'll try again later
				return false;
			end
			
			local equippedItemLocation = ItemLocation:CreateFromEquipmentSlot(sourceItem:GetInventoryType());
			local equippedItemSource = AzeriteEmpoweredItemDataSource:CreateFromItemLocation(equippedItemLocation);
			
			if not allTierInfo then return end
			
			-- Create some separation from other tooltip text
			self:AddLine(" ")
			local debugText = "Power Intelligence Values"
			self:AddLine(debugText)
			
			for j=1, 3 do
				local tierInfo = allTierInfo[j];
				
				local azeritePowerID = tierInfo["azeritePowerIDs"][1]

				if azeritePowerID == 13 then break end -- Ignore +5 item level tier
				
				local azeriteTooltipText = " "
				
				local comparisonPowerID = AzeriteUtil.GetSelectedAzeritePowerInTier(owningItemSource, j);
				-- If we have selected a power we show that. If not we show all available
				if comparisonPowerID then
					local azeriteSpellID = DiscAzeriteArmor_GetSpellID(comparisonPowerID)				
					local azeritePowerName, _, icon = GetSpellInfo(azeriteSpellID)
					if (powerData[comparisonPowerID]) then
						local intValue = powerData[comparisonPowerID]["intValues"][itemLevel]
						azeriteTooltipText = azeriteTooltipText.."  "..azeritePowerName.."("..comparisonPowerID..") |cFF00FF00+"..intValue.."|r Intellect"
					else
						azeriteTooltipText = azeriteTooltipText.."  "..azeritePowerName.."("..comparisonPowerID..")"
					end
				else
					for powerIndex, azeritePowerID in ipairs(tierInfo.azeritePowerIDs) do
						local azeriteSpellID = DiscAzeriteArmor_GetSpellID(azeritePowerID)				
						local azeritePowerName, _, icon = GetSpellInfo(azeriteSpellID)
						
						if C_AzeriteEmpoweredItem.IsPowerAvailableForSpec(azeritePowerID, specID) then
							if (powerData[azeritePowerID]) then
								local intValue = powerData[azeritePowerID]["intValues"][itemLevel]
								azeriteTooltipText = azeriteTooltipText.." |cFFFFFFFF"..azeritePowerName.."("..azeritePowerID..") |cFF00FF00+"..intValue.."|r"
							else
								azeriteTooltipText = azeriteTooltipText.." |cFFFFFFFF"..azeritePowerName.."("..azeritePowerID..")|r"
							end
						end			
					end
				end
				
				self:AddLine(azeriteTooltipText)
			end
			
			self:AddLine("GNU!")
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
	obj:HookScript("OnTooltipSetItem", OnTooltipSetItem)
end
