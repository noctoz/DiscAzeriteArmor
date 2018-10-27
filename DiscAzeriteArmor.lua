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
	[493] = {
		["name"] = "Last Gift",
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
	[193] = {
		["name"] = "Blightborne Infusion",
		["intValues"] = {
			[340] = 181,
			[345] = 185,
			[355] = 194,
			[360] = 198,
			[370] = 208,
			[375] = 212,
			[385] = 221,
			[390] = 226,
		}
	},
	[196] = {
		["name"] = "Swirling Sands",
		["intValues"] = {
			[340] = 178,
			[345] = 182,
			[355] = 191,
			[360] = 195,
			[370] = 204,
			[375] = 208,
			[385] = 218,
			[390] = 222,
		}
	},
	[192] = {
		["name"] = "Meticulous Scheming",
		["intValues"] = {
			[340] = 173,
			[345] = 177,
			[355] = 186,
			[360] = 191,
			[370] = 199,
			[375] = 203,
			[385] = 212,
			[390] = 217,
		}
	},
	[399] = {
		["name"] = "Enduring Luminescence",
		["intValues"] = {
			[340] = 201,
			[345] = 202,
			[355] = 204,
			[360] = 205,
			[370] = 208,
			[375] = 209,
			[385] = 212,
			[390] = 214,
		}
	},
	[489] = {
		["name"] = "Sylvanas' Resolve",
		["intValues"] = {
			[340] = 130,
			[345] = 136,
			[355] = 150,
			[360] = 157,
			[370] = 172,
			[375] = 181,
			[385] = 198,
			[390] = 208,
		}
	},
	[495] = {
		["name"] = "Anduin's Dedication",
		["intValues"] = {
			[340] = 130,
			[345] = 136,
			[355] = 150,
			[360] = 157,
			[370] = 172,
			[375] = 181,
			[385] = 198,
			[390] = 208,
		}
	},
	[492] = {
		["name"] = "Liberator's Might",
		["intValues"] = {
			[340] = 156,
			[345] = 161,
			[355] = 168,
			[360] = 172,
			[370] = 180,
			[375] = 184,
			[385] = 192,
			[390] = 196,
		}
	},
	[486] = {
		["name"] = "Glory in Battle",
		["intValues"] = {
			[340] = 156,
			[345] = 161,
			[355] = 168,
			[360] = 172,
			[370] = 180,
			[375] = 184,
			[385] = 192,
			[390] = 196,
		}
	},
	[504] = {
		["name"] = "Unstable Catalyst",
		["intValues"] = {
			[340] = 120,
			[345] = 126,
			[355] = 138,
			[360] = 145,
			[370] = 159,
			[375] = 166,
			[385] = 183,
			[390] = 192,
		}
	},
	[404] = {
		["name"] = "Death Throes",
		["intValues"] = {
			[340] = 106,
			[345] = 112,
			[355] = 123,
			[360] = 128,
			[370] = 141,
			[375] = 148,
			[385] = 163,
			[390] = 170,
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
	},[505] = {
		["name"] = "Tradewinds",
		["intValues"] = {
			[340] = 136,
			[345] = 138,
			[355] = 145,
			[360] = 148,
			[370] = 155,
			[375] = 158,
			[385] = 165,
			[390] = 168,
		}
	},[480] = {
		["name"] = "Blood Rite",
		["intValues"] = {
			[340] = 130,
			[345] = 133,
			[355] = 139,
			[360] = 142,
			[370] = 149,
			[375] = 152,
			[385] = 159,
			[390] = 162,
		}
	},[481] = {
		["name"] = "Incite the Pack",
		["intValues"] = {
			[340] = 126,
			[345] = 129,
			[355] = 135,
			[360] = 139,
			[370] = 145,
			[375] = 148,
			[385] = 154,
			[390] = 158,
		}
	}, [397] = {
		["name"] = "Gift of Forgiveness",
		["intValues"] = {
			[340] = 92,
			[345] = 96,
			[355] = 106,
			[360] = 111,
			[370] = 122,
			[375] = 128,
			[385] = 141,
			[390] = 147,
		}
	}, [485] = {
		["name"] = "Laser Matrix",
		["intValues"] = {
			[340] = 88,
			[345] = 92,
			[355] = 102,
			[360] = 106,
			[370] = 116,
			[375] = 122,
			[385] = 134,
			[390] = 140,
		}
	}, [164] = {
		["name"] = "Weal and Woe",
		["intValues"] = {
			[340] = 71,
			[345] = 74,
			[355] = 82,
			[360] = 86,
			[370] = 94,
			[375] = 99,
			[385] = 109,
			[390] = 112,
		}
	}, [398] = {
		["name"] = "Contemptuous Homility",
		["intValues"] = {
			[340] = 60,
			[345] = 61,
			[355] = 63,
			[360] = 64,
			[370] = 67,
			[375] = 68,
			[385] = 71,
			[390] = 72,
		}
	}, [497] = {
		["name"] = "Stand As One",
		["intValues"] = {
			[340] = 42,
			[345] = 44,
			[355] = 48,
			[360] = 50,
			[370] = 55,
			[375] = 58,
			[385] = 64,
			[390] = 67,
		}
	}, [491] = {
		["name"] = "Collective Will",
		["intValues"] = {
			[340] = 42,
			[345] = 44,
			[355] = 48,
			[360] = 50,
			[370] = 55,
			[375] = 58,
			[385] = 64,
			[390] = 67,
		}
	}, [496] = {
		["name"] = "Stronger Together",
		["intValues"] = {
			[340] = 38,
			[345] = 40,
			[355] = 44,
			[360] = 46,
			[370] = 50,
			[375] = 53,
			[385] = 58,
			[390] = 61,
		}
	}, [113] = {
		["name"] = "Moment of Repose",
		["intValues"] = {
			[340] = 30,
			[345] = 32,
			[355] = 35,
			[360] = 36,
			[370] = 40,
			[375] = 41,
			[385] = 46,
			[390] = 48,
		}
	}, [227] = {
		["name"] = "Depth of the Shadows",
		["intValues"] = {
			[340] = 26,
			[345] = 28,
			[355] = 30,
			[360] = 31,
			[370] = 35,
			[375] = 36,
			[385] = 40,
			[390] = 42,
		}
	}, [82] = {
		["name"] = "Champion of Azeroth",
		["intValues"] = {
			[340] = 0,
			[345] = 0,
			[355] = 200,
			[360] = 200,
			[370] = 0,
			[375] = 0,
			[385] = 0,
			[390] = 0,
		}
	}, [501] = {
		["name"] = "Relational Normalization Gizmo",
		["intValues"] = {
			[340] = 193,
			[345] = 202,
			[355] = 0,
			[360] = 0,
			[370] = 0,
			[375] = 0,
			[385] = 0,
			[390] = 0,
		}
	}, [499] = {
		["name"] = "Ricocheting Inflatable Pyrosaw",
		["intValues"] = {
			[340] = 80,
			[345] = 84,
			[355] = 0,
			[360] = 0,
			[370] = 0,
			[375] = 0,
			[385] = 0,
			[390] = 0,
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
			local debugText = "Int value for Azerite traits"
			self:AddLine(debugText)
			
			local totalInt = 0
			
			for j=1, 3 do
				local tierInfo = allTierInfo[j];
				
				local highestTierInt = 0
				
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
							local intValue = powerData[azeritePowerID] and powerData[azeritePowerID]["intValues"][itemLevel] or 0
							-- We get the highest value to present the total int of the item
							if intValue > highestTierInt then
								highestTierInt = intValue
							end
							azeriteTooltipText = azeriteTooltipText.." |cFFFFFFFF"..azeritePowerName.." |cFF00FF00+"..intValue.."|r"
						end			
					end
				end
				
				totalInt = totalInt + highestTierInt
				self:AddLine(azeriteTooltipText)
			end
			
			local stats = GetItemStats(item)
			
			self:AddLine("Int from traits: |cFF00FF00+"..totalInt.."|r")
			self:AddLine("Total Int for item: |cFFFFFFFF"..(stats["ITEM_MOD_INTELLECT_SHORT"] + totalInt).."|r")
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
	obj:HookScript("OnTooltipSetItem", OnTooltipSetItem)
end
