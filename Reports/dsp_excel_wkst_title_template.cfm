
<!-- Reports\dsp_excel_wkst_title_template.cfm
	Author: Josh P-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 
	||
	Name: Josh Peters
	||
	Edits: 
	$Log$
	Revision 1.1  2005/03/09 18:06:30  stetzer
	<>

	Revision 1.1  2001-10-11 13:02:58-04  long
	Added FuseDoc

	||
	Variables:
	
	END FUSEDOC --->
</cfsilent><!--- dsp_excel_wkst_title_template.cfm --->

<cfoutput>	

	title_ending_letter = (#cols_needed_count# + 64)
	title_ending_letter = (chr(title_ending_letter))

	set assign_sheet = MyExcelChart.Sheets(#curr_sheet#)
	
<!--- FILL THE TITLE CELLS AND FORMAT THEM BY USING CUSTOM WRITTEN FUNCTION:
CELL = FillFormatCell(sheet,cRange,cText,cWidth,rHeight,fSize) --->	
	CELL = FillFormatCell(assign_sheet,"A1","#session.workstream_company_name#",31.57,23.25,18)
	CELL = FillFormatCell(assign_sheet,"A2","Expense Report",0,18.75,14)
	CELL = FillFormatCell(assign_sheet,"A3","#Get_reimbursement_types.Reimbursement_Type#",0,18.75,12)
	CELL = FillFormatCell(assign_sheet,"A4","Presented by workstream",0,15.75,12)
	CELL = FillFormatCell(assign_sheet,"A5","   ",0,15.75,12)
	CELL = FillFormatCell(assign_sheet,"A6","Report For #from_date# - #through_date#",0,16.50,12)   
	CELL = FillFormatCell(assign_sheet,"D5","",0,0,12)
</cfoutput>

<!--- ADD THE BORDER AND THE BACKGROUND TO THIS REPORT --->
set rng_sum_title = assign_sheet.Range("A1:" & title_ending_letter & "6")

With rng_sum_title 
	.Font.Name = "Times"
	.Font.Bold = "True"
	.HorizontalAlignment = 7
	.Borders(2).LineStyle = borderLine_dblLines
	.Borders(2).Weight = 1
	.Interior.ColorIndex = 0
    .Interior.Pattern = 17
    .Interior.PatternColorIndex = -4105
end With	

i = 7

<!--- LOOP OVER BORDERS AND SET FOR TITLE --->	
Do While i < 11
	assign_sheet.Range("A1:" & title_ending_letter & "6").Borders(i).Weight = 4
	assign_sheet.Range("A1:" & title_ending_letter & "6").Borders(i).LineStyle = borderLine_dblLines	
	i = i + 1
Loop	 

