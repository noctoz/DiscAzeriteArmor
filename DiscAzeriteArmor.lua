local GetItemInfo = GetItemInfo
local GetItemQualityColor = GetItemQualityColor

local powerData = {
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
	}
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
		local _, _, quality, itemLevel = GetItemInfo(item)
		if(quality) then
			local r, g, b = GetItemQualityColor(quality)

			self:SetBackdropBorderColor(r, g, b)
			self:SetBackdropColor(0, 0, 0, 1)
		end
		
		if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(item) then
			local specID = GetSpecializationInfo(GetSpecialization())
			local allTierInfo = C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(item)
			
			if not allTierInfo then return end
			
			-- Create some separation from other tooltip text
			self:AddLine(" ")
			local debugText = "Debug: "..itemLevel
			self:AddLine(debugText)
			
			for j=1, 3 do
				local tierLevel = allTierInfo[j]["unlockLevel"]
				local azeritePowerID = allTierInfo[j]["azeritePowerIDs"][1]

				if azeritePowerID == 13 then break end -- Ignore +5 item level tier

				if not allTierInfo[1]["azeritePowerIDs"][1] then return end

				local azeriteTooltipText = " "
				for i, _ in pairs(allTierInfo[j]["azeritePowerIDs"]) do
					local azeritePowerID = allTierInfo[j]["azeritePowerIDs"][i]
					local azeriteSpellID = DiscAzeriteArmor_GetSpellID(azeritePowerID)				
					local azeritePowerName, _, icon = GetSpellInfo(azeriteSpellID)
					
					if C_AzeriteEmpoweredItem.IsPowerAvailableForSpec(azeritePowerID, specID) then
						if (powerData[azeritePowerID]) then
							local intValue = powerData[azeritePowerID]["intValues"][itemLevel]
							azeriteTooltipText = azeriteTooltipText.."  "..azeritePowerName.."("..azeritePowerID..")("..intValue..")"
						else
							azeriteTooltipText = azeriteTooltipText.."  "..azeritePowerName.."("..azeritePowerID..")"
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
