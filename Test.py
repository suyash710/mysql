import re
import xlwt
with open('01_college_TBL_create_20160620.sql') as f:
    sqlContent = f.read().splitlines()

    
    subType= "#Type";
for typeData in sqlContent:
    if subType in typeData:
        typeData= typeData.split();
        Type=typeData[len(typeData)-1];
        print("\n\nType is - ",Type,"\n\n");

        subName="CREATE";
        print(sqlContent);
for nameData in sqlContent:
	if subName in nameData:
	        nameData=nameData.split();
	        Name=nameData[len(nameData)-2];
	        print("\nFile_name - ",Name,"\n\n");

	        book=xlwt.Workbook(encoding='utf-8');
	        sheet1=book.add_sheet("Sheet_1");

	        sheet1.write(0,0,"");
	        sheet1.write(0,1,"Type-");
	        sheet1.write(0,2,"Name-");

	        sheet1.write(1,1,Type);
	        sheet1.write(1,2,Name);

	        book.save("book.xls");
	        mmmm;