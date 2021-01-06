-- n is the addonTable
local addonName, n = ...

local GetItemInfo = GetItemInfo
local GetItemQualityColor = GetItemQualityColor

function DiscHelper_GetSpellID(powerID)
	local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(powerID)
  	if (powerInfo) then
    	local azeriteSpellID = powerInfo["spellID"]
    	return azeriteSpellID
  	end
end

function DiscHelper_GetBagPosition(itemLink)
    for bag = 0, NUM_BAG_SLOTS do
        for slot = 1, GetContainerNumSlots(bag) do
            if(GetContainerItemLink(bag, slot) == itemLink) then
                return bag, slot
            end
        end
    end
end

local OnTooltipSetItem = function(self, ...)
	--print("Entered OnTooltipSetItem")
	local name, itemLink = self:GetItem()
	if itemLink then
		--print("ItemLink valid")
		local _, _, quality, itemLevel, _, _, _, _, itemEquipLoc = GetItemInfo(itemLink)
		
		if itemEquipLoc == "INVTYPE_TRINKET" then
			local itemString = string.match(itemLink, "item[%-?%d:]+")
			local _, itemIdString, _, _, _, _, _, _, _, _, _, _, _, _ = strsplit(":", itemString)
			itemId = tonumber(itemIdString)
			--print("Show data for trinket with id: "..itemId)
			-- Uncomment to debug item id
			self:AddLine("ItemID: "..itemId)

			if n.trinketData[itemId] then
				--print("Add tooltip for trinket with level: "..itemLevel)
				-- Create some separation from other tooltip text
				--self:AddLine(" ")
				self:AddLine("Estimated HPS Gain: |cFF00FF00+"..n.trinketData[itemId]["hpsValues"][itemLevel].."|r")

				-- Create some spacing after
				self:AddLine(" ")
			end
		end
	end
end

local OnConduitTooltip = function(self, ...)
	--print("Entered OnConduitTooltip")
	conduitID = select(1, ...)
	--print("ConduitID: "..conduitID)
	spellID = C_Soulbinds.GetConduitSpellID(conduitID, select(2, ...))
	--print("SpellID: "..spellID)
	conduitRank = C_Soulbinds.GetConduitRankFromCollection(conduitID)
	--print("ConduitRank: "..conduitRank)
	itemLevel = C_Soulbinds.GetConduitItemLevel(conduitID, conduitRank)
	--print("ItemLevel: "..itemLevel)
	-- Create some separation from other tooltip text
	self:AddLine(" ")

	-- Uncomment to debug item id
	self:AddLine("ConduitID: "..conduitID)

	conduitData = n.conduitData[conduitID]
	if conduitData then
		self:AddLine("Estimated HPS Gain: |cFF00FF00+"..conduitData["hpsValues"][itemLevel].."|r")
		if conduitData["special"] then
			-- Handle special case 0
			special0 = conduitData["special"][0]
			if special0 then
				self:AddLine("Estimated HPS Gain "..special0["desc"]..": |cFF00FF00+"..special0["values"][itemLevel].."|r")
			end
			-- Handle special case 1
			special1 = conduitData["special"][1]
			if special1 then
				self:AddLine("Estimated HPS Gain "..special1["desc"]..": |cFF00FF00+"..special1["values"][itemLevel].."|r")
			end
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

--hooksecurefunc("TaskPOI_OnEnter", OnConduitTooltip)
hooksecurefunc(GameTooltip, "SetConduit", OnConduitTooltip)

print("|cFF4863A0DiscAzeriteArmor 1.11.0 loaded. Data updated January 23th 2020.")
