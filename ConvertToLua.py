import xlrd

def main():
	book = xlrd.open_workbook(r"C:\Users\Johan\Dropbox\DiscStuff\TraitRankings20181114.xlsx")
	
	f = open("Data.lua","w+")
	
	f.write("-- n is the addonTable\n")
	f.write("local addonName, n = ...\n")
	f.write("n.powerData = {\n")
	
	for sheet in book.sheets():
		if not sheet.name == "Data":
			continue
			
		# Process outer ring traits
		f.write("\t[1] = {\n")
		
		for row_idx in range(1,31):
			id = sheet.cell_value(row_idx, 0)
			f.write("\t\t[%d] = {\n" % id)
			name = sheet.cell_value(row_idx, 1)
			f.write("\t\t\t[\"name\"] = \"%s\",\n" % name)
			f.write("\t\t\t[\"intValues\"] = {\n")
			itemLevels = [340, 345, 355, 360, 370, 375, 385, 390]
			for i in range(8):
				value = sheet.cell_value(row_idx, i+2)
				f.write("\t\t\t\t[%d] = %d,\n" % (itemLevels[i], value))
			
			f.write("\t\t\t}\n")
			f.write("\t\t},\n")
			
		f.write("\t},\n")
			
		# Process middle ring traits
		f.write("\t[2] = {\n")
		
		for row_idx in range(32,45):
			id = sheet.cell_value(row_idx, 0)
			f.write("\t\t[%d] = {\n" % id)
			name = sheet.cell_value(row_idx, 1)
			f.write("\t\t\t[\"name\"] = \"%s\",\n" % name)
			f.write("\t\t\t[\"intValues\"] = {\n")
			itemLevels = [340, 345, 355, 360, 370, 375, 385, 390]
			for i in range(8):
				value = sheet.cell_value(row_idx, i+2)
				f.write("\t\t\t\t[%d] = %d,\n" % (itemLevels[i], value))
			
			f.write("\t\t\t}\n")
			f.write("\t\t},\n")
			
		f.write("\t},\n")
		
		# Process inner ring traits
		f.write("\t[3] = {\n")
		
		for row_idx in range(46,53):
			id = sheet.cell_value(row_idx, 0)
			f.write("\t\t[%d] = {\n" % id)
			name = sheet.cell_value(row_idx, 1)
			f.write("\t\t\t[\"name\"] = \"%s\",\n" % name)
			f.write("\t\t\t[\"intValues\"] = {\n")
			itemLevels = [340, 345, 355, 360, 370, 375, 385, 390]
			for i in range(8):
				value = sheet.cell_value(row_idx, i+2)
				f.write("\t\t\t\t[%d] = %d,\n" % (itemLevels[i], value))
			
			f.write("\t\t\t}\n")
			f.write("\t\t},\n")
			
		f.write("\t},\n")
	
	f.write("}\n")
	f.close()

if __name__=="__main__":
	main()
	