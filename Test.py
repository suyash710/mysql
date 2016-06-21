import re
import xlwt
with open('02_Class_TBL_create_20160620.sql') as f:
    content = f.read().splitlines()
    
    sub1= "#Type";
for text in content:
    if sub1 in text:
        text= text.split();
        Type=text[len(text)-1];
        print("\n\nType is - ",Type,"\n\n");

        sub2="CREATE";
for text2 in content:
	if sub2 in text2:
	        text2=text2.split();
	        Name=text2[len(text2)-2];
	        print("File_name - ",Name,"\n\n");

	        book=xlwt.Workbook(encoding='utf-8');
	        sheet1=book.add_sheet("Sheet_1");

	        sheet1.write(0,0,"");
	        sheet1.write(0,1,"Type-");
	        sheet1.write(0,2,"Name-");

	        sheet1.write(1,1,Type);
	        sheet1.write(1,2,Name);

	        book.save("book.xls");