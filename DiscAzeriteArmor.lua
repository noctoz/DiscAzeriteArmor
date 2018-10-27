local GetItemInfo = GetItemInfo
local GetItemQualityColor = GetItemQualityColor

local powerData = {
	[1] = {
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
	}, [2] = {
		[103] = {
			["name"] = "Concentrated Mending",
			["intValues"] = {
				[340] = 97,
				[345] = 100,
				[355] = 109,
				[360] = 116,
				[370] = 128,
				[375] = 134,
				[385] = 147,
				[390] = 153,
			}
		}, [463] = {
			["name"] = "Blessed Portent",
			["intValues"] = {
				[340] = 75,
				[345] = 78,
				[355] = 86,
				[360] = 90,
				[370] = 99,
				[375] = 103,
				[385] = 113,
				[390] = 119,
			}
		}, [30] = {
			["name"] = "Overwhelming Power",
			["intValues"] = {
				[340] = 89,
				[345] = 89,
				[355] = 94,
				[360] = 98,
				[370] = 103,
				[375] = 103,
				[385] = 107,
				[390] = 112,
			}
		}, [18] = {
			["name"] = "Blood Siphon",
			["intValues"] = {
				[340] = 68,
				[345] = 70,
				[355] = 75,
				[360] = 76,
				[370] = 82,
				[375] = 84,
				[385] = 89,
				[390] = 92,
			}
		}, [461] = {
			["name"] = "Earthlink",
			["intValues"] = {
				[340] = 53,
				[345] = 56,
				[355] = 60,
				[360] = 63,
				[370] = 70,
				[375] = 74,
				[385] = 81,
				[390] = 84,
			}
		}, [21] = {
			["name"] = "Elemental Whirl",
			["intValues"] = {
				[340] = 63,
				[345] = 64,
				[355] = 68,
				[360] = 69,
				[370] = 72,
				[375] = 74,
				[385] = 77,
				[390] = 79,
			}
		}, [19] = {
			["name"] = "Woundbinder",
			["intValues"] = {
				[340] = 62,
				[345] = 64,
				[355] = 67,
				[360] = 68,
				[370] = 72,
				[375] = 73,
				[385] = 76,
				[390] = 78,
			}
		}, [459] = {
			["name"] = "Unstable Flames",
			["intValues"] = {
				[340] = 58,
				[345] = 59,
				[355] = 62,
				[360] = 64,
				[370] = 66,
				[375] = 68,
				[385] = 71,
				[390] = 72,
			}
		}, [38] = {
			["name"] = "On My Way",
			["intValues"] = {
				[340] = 52,
				[345] = 53,
				[355] = 57,
				[360] = 57,
				[370] = 61,
				[375] = 61,
				[385] = 64,
				[390] = 66,
			}
		}, [104] = {
			["name"] = "Bracing Chill",
			["intValues"] = {
				[340] = 33,
				[345] = 35,
				[355] = 39,
				[360] = 40,
				[370] = 44,
				[375] = 46,
				[385] = 51,
				[390] = 53,
			}
		}, [105] = {
			["name"] = "Ephemeral Recovery",
			["intValues"] = {
				[340] = 35,
				[345] = 35,
				[355] = 38,
				[360] = 38,
				[370] = 40,
				[375] = 40,
				[385] = 42,
				[390] = 42,
			}
		}, [42] = {
			["name"] = "Savior",
			["intValues"] = {
				[340] = 20,
				[345] = 21,
				[355] = 23,
				[360] = 24,
				[370] = 27,
				[375] = 28,
				[385] = 31,
				[390] = 32,
			}
		}, [102] = {
			["name"] = "Synergistic Growth",
			["intValues"] = {
				[340] = 23,
				[345] = 23,
				[355] = 25,
				[360] = 25,
				[370] = 26,
				[375] = 27,
				[385] = 28,
				[390] = 29,
			}
		},
	}, [3] = {
		[83] = {
			["name"] = "Impassive Visage",
			["intValues"] = {
				[340] = 121,
				[345] = 127,
				[355] = 140,
				[360] = 146,
				[370] = 160,
				[375] = 168,
				[385] = 185,
				[390] = 193,
			}
		}, [472] = {
			["name"] = "Twist Magic",
			["intValues"] = {
				[340] = 94,
				[345] = 99,
				[355] = 109,
				[360] = 113,
				[370] = 124,
				[375] = 131,
				[385] = 144,
				[390] = 150,
			}
		}, [15] = {
			["name"] = "Resounding Protection",
			["intValues"] = {
				[340] = 86,
				[345] = 90,
				[355] = 100,
				[360] = 104,
				[370] = 114,
				[375] = 120,
				[385] = 132,
				[390] = 138,
			}
		}, [204] = {
			["name"] = "Sanctum",
			["intValues"] = {
				[340] = 81,
				[345] = 85,
				[355] = 93,
				[360] = 97,
				[370] = 107,
				[375] = 112,
				[385] = 123,
				[390] = 129,
			}
		}, [87] = {
			["name"] = "Self Reliance",
			["intValues"] = {
				[340] = 25,
				[345] = 27,
				[355] = 29,
				[360] = 31,
				[370] = 34,
				[375] = 35,
				[385] = 39,
				[390] = 41,
			}
		}, [502] = {
			["name"] = "Personal Absorb-o-Tron",
			["intValues"] = {
				[340] = 102,
				[345] = 107,
				[355] = 0,
				[360] = 0,
				[370] = 0,
				[375] = 0,
				[385] = 0,
				[390] = 0,
			}
		}, [503] = {
			["name"] = "Auto-Self-Cauterizer",
			["intValues"] = {
				[340] = 63,
				[345] = 66,
				[355] = 0,
				[360] = 0,
				[370] = 0,
				[375] = 0,
				[385] = 0,
				[390] = 0,
			}
		},
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
			local debugText = "Intellect from Azerite Powers:"
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
					local intValue = powerData[j][comparisonPowerID] and powerData[j][comparisonPowerID]["intValues"][itemLevel] or 0
					-- We get the highest value to present the total int of the item
					if intValue > highestTierInt then
						highestTierInt = intValue
					end
					azeriteTooltipText = azeriteTooltipText.." |cFFFFFFFF"..azeritePowerName.." |cFF00FF00+"..intValue.."|r"
				else
					for powerIndex, azeritePowerID in ipairs(tierInfo.azeritePowerIDs) do
						local azeriteSpellID = DiscAzeriteArmor_GetSpellID(azeritePowerID)				
						local azeritePowerName, _, icon = GetSpellInfo(azeriteSpellID)
						
						if C_AzeriteEmpoweredItem.IsPowerAvailableForSpec(azeritePowerID, specID) then
							local intValue = powerData[j][azeritePowerID] and powerData[j][azeritePowerID]["intValues"][itemLevel] or 0
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
			
			self:AddLine("Total from Powers: |cFF00FF00+"..totalInt.." Intellect|r")
			self:AddLine("Total: |cFFFFFFFF+"..(stats["ITEM_MOD_INTELLECT_SHORT"] + totalInt).." Intellect|r")
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
