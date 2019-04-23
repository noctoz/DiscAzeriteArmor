import sys
import xlrd

def main():
	if len(sys.argv) != 2:
		print("Wrong number of arguments to function")
		return
		
	book = xlrd.open_workbook(sys.argv[1])

	rawData = {}
	trinketData = {}
	traitData = {} # This just hold the trait ids
	trinketIds = {}

	# Not all levels might be present in raw data so we need to have it here
	itemLevels = [340, 345, 355, 360, 370, 375, 385, 390, 400, 405, 415, 420]
	
	for sheet in book.sheets():
		# Azerite data is on the "RawAzerite" sheet
		if sheet.name == "RawAzerite":

			for row_idx in range(0,sheet.nrows):
				# Get name
				name = sheet.cell_value(row_idx, 3)

				# Handle empty rows
				if name == "":
					continue

				stacked = False
				twoDot = False

				# Deal with stacked
				if name == "Enduring Luminescence x2" or name == "Depth of the Shadows x2" or name == "Sudden Revelation x2":
					name = name[:-3]
					stacked = True

				# Special death throes handling
				if name == "Death Throes":
					continue

				if name == "Death Throes 1 Target":
					name = "Death Throes"

				if name == "Death Throes 2 Target":
					name = "Death Throes"
					twoDot = True

				tier = sheet.cell_value(row_idx, 5)

				if rawData.get(tier) == None:
					rawData[tier] = {}

				#print("Name: " + name)
				if rawData[tier].get(name) == None:
					rawData[tier][name] = {}
				
				level = int(sheet.cell_value(row_idx, 1))
				hps = float(sheet.cell_value(row_idx, 19))

				hpsPerInt = 3.2

				intValue = hps / hpsPerInt

				if stacked:
					if rawData[tier][name].get("stacked") == None:
						rawData[tier][name]["stacked"] = {}

					rawData[tier][name]["stacked"][level] = intValue
				elif twoDot:
					if rawData[tier][name].get("twoDot") == None:
						rawData[tier][name]["twoDot"] = {}

					rawData[tier][name]["twoDot"][level] = intValue
				else:
					if rawData[tier][name].get("intValues") == None:
						rawData[tier][name]["intValues"] = {}

					rawData[tier][name]["intValues"][level] = intValue

		# Trinket data is on the "RawTrinket" sheet
		if sheet.name == "RawTrinket":

			for row_idx in range(0,sheet.nrows):
				# Get name
				name = sheet.cell_value(row_idx, 3)

				# Handle empty rows
				if name == "":
					continue

				# Deal with special case of N/A item value
				levelString = sheet.cell_value(row_idx, 1)
				if levelString == "N/A":
					continue

				if trinketData.get(name) == None:
					trinketData[name] = {}

				level = int(levelString)
				hps = float(sheet.cell_value(row_idx, 20))

				trinketData[name][level] = hps

		# Read the trait ids
		if sheet.name == "TraitData":
			for row_idx in range(0, sheet.nrows):
				# Get name
				name = sheet.cell_value(row_idx, 1)

				# Handle empty rows
				if name == "":
					continue

				id = int(sheet.cell_value(row_idx, 0))

				traitData[name] = id

		# Read the trinket ids
		if sheet.name == "Trinket":
			for row_idx in range(0, sheet.nrows):
				# Get name
				name = sheet.cell_value(row_idx, 1)

				# Handle empty rows
				if name == "":
					continue

				id = int(sheet.cell_value(row_idx, 0))

				trinketIds[name] = id

	# Create lua data file
	f = open("Data.lua","w+")
	
	f.write("-- n is the addonTable\n")
	f.write("local addonName, n = ...\n")

	# Write azerite data
	f.write("n.powerData = {\n")

	tierIds = { "T3": 1, "T2": 2, "T1": 3 }
			
	# Process all tiers
	for tierName in rawData:
		tier = rawData[tierName]
		f.write("\t[%d] = {\n" % tierIds[tierName])

		for traitName in sorted(tier):
			# We filter out some traits we are not interested in
			if traitData.get(traitName) == None:
				continue

			id = traitData[traitName]
			trait = tier[traitName]
			f.write("\t\t[%d] = {\n" % id)
			f.write("\t\t\t[\"name\"] = \"%s\",\n" % traitName)

			# Handle int values
			f.write("\t\t\t[\"intValues\"] = {\n")
			for level in itemLevels:
				value = 0
				if trait["intValues"].get(level) != None:
					value = trait["intValues"][level]

				f.write("\t\t\t\t[%d] = %d,\n" % (level, round(value)))

			f.write("\t\t\t},\n")

			# Handle stacked
			if trait.get("stacked") != None:
				f.write("\t\t\t[\"stacked\"] = {\n")
				for level in itemLevels:
					value = 0
					if trait["stacked"].get(level) != None:
						value = trait["stacked"][level]

					f.write("\t\t\t\t[%d] = %d,\n" % (level, round(value)))

				f.write("\t\t\t}\n")

			# Handle twoDot
			if trait.get("twoDot") != None:
				f.write("\t\t\t[\"twoDot\"] = {\n")
				for level in itemLevels:
					value = 0
					if trait["twoDot"].get(level) != None:
						value = trait["twoDot"][level]

					f.write("\t\t\t\t[%d] = %d,\n" % (level, round(value)))

				f.write("\t\t\t}\n")

			f.write("\t\t},\n") # end of trait

		f.write("\t},\n") # end of tier

	f.write("}\n") # end of n.powerData
	f.write("\n") # create some space before trinket data

	# Write trinket data
	f.write("n.trinketData = {\n")
			
	for trinketName in sorted(trinketData):
		# Filter out trinkets we are not handling
		if trinketIds.get(trinketName) == None:
			continue

		id = trinketIds[trinketName]
		
		trinket = trinketData[trinketName]
		f.write("\t[%d] = {\n" % id)
		f.write("\t\t[\"name\"] = \"%s\",\n" % trinketName)
		f.write("\t\t[\"hpsValues\"] = {\n")

		for level in range(300, 425, 5):
			value = 0
			if trinket.get(level) != None:
				value = trinket[level]
				
			f.write("\t\t\t\t[%d] = %d,\n" % (level, round(value)))
		
		f.write("\t\t}\n")
		f.write("\t},\n")
		
	f.write("}\n") # End of n.trinketData

	f.close()

if __name__=="__main__":
	main()
	