import re
import xlwt

# read the File.....
with open('01_college_TBL_create_20160620.sql') as f:
    sqlContent = f.read().splitlines()

    
    subType= "#Type"; 
for typeData in sqlContent:       #for loop to find the "Type" of SQL data file. 
    if subType in typeData:		
        typeData= typeData.split();
        Type=typeData[len(typeData)-1];				
        print("\n\nType is - ",Type,"\n\n");			# prints the Type of SQL data

        subName="CREATE";
        print(sqlContent);
for nameData in sqlContent:			#for loop to get the SQL file Name.
	if subName in nameData:
	        nameData=nameData.split();	
	        Name=nameData[len(nameData)-2];
	        print("\nFile_name - ",Name,"\n\n");		#prints the SQL file Name.

	        dataSQL=xlwt.Workbook(encoding='utf-8');	# makes an Excel file	
	        sheet1=dataSQL.add_sheet("Sheet_1");		# adds a Sheet to the file

	        sheet1.write(0,0,"#");			# adds the Index to the excel sheet.
	        sheet1.write(0,1,"Type-");
	        sheet1.write(0,2,"Name-");

	        sheet1.write(1,1,Type);			#writes the Type to sheet.		
	        sheet1.write(1,2,Name);			#writes the name to sheet.
	        sheet1.write(1,0,"1");
	        
	        dataSQL.save("dataSQL.xls");		#Name of the Excel Sheet