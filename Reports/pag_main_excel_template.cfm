<!--- ExpenseReports/pag_main_excel_template.cfm --->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

<!-- Reports\pag_main_excel_template.cfm
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
	||
	Variables:
	
	END FUSEDOC --->
</cfsilent>
	<title>Excel Report Automation</title>
	
	
<cfparam name="CURR_SHEET" DEFAULT="1">			<!--- WE KEEP TRACK OF WHAT WORKSHEET WE ARE AUTOMATING WITH THIS VARIABLE --->	
<cfset tab_names_list = "tab1,tab2,tab3,tab4">	<!--- LIST ALL THE WKST TAB NAMES IN THE REPORT --->	

<script language="vbscript">
	<cfinclude template="excel_constants.cfm"><!--- COMMON CONSTANTS USED --->
	<cfinclude template="vbs_excel_custom_functions.cfm"><!--- CUSTOM FUNCTS THAT I WROTE --->
	
	Sub makeFile()
		<!--- Variable Declarations --->
		Dim assign_sheet 	<!--- CURRENT WKST WE ARE WORKING WITH (OBJECT)--->
		Dim MyExcelChart	<!--- EXCEL APPLICATION (OBJECT) --->			
		Dim wb				<!--- CURRENT WORKBOOK (OBJECT) --->
		Dim wkst_title		<!--- TEXT PRINTED AT TOP OF REPORT --->
		
		<!--- BORDER CONSTANTS --->
		Const Bottom=9, Left=7, Right=10, Top=8, Horizontal=12, Vertical=11
		
		<!--- CREATE EXCEL OBJECT --->
		Set MyExcelChart = CreateObject("Excel.Application")		
		
		<!--- CREATE WORKBOOK OBJECT --->
		set wb = MyExcelChart.workbooks.add		
		
		<!--- MAKE EXCEL WORKSHEET VISIBLE WHILE BUILDING REPORT.  NOTE: This can be set to false if you want the code to completely run before showing user. --->
		MyExcelChart.Application.Visible = True	
		
		<!--- Build the tabs --->
		<cfinclude template="act_build_excel_wkst_tabs.cfm">

<!--- BUILD WORKSHEET(S) --->		
		<!--- Identify Worksheet --->			
		<cfset wkst_id = "tab1">
				
		<!--- DISPLAY WORKSHEET TITLE --->
		<cfinclude template="dsp_excel_wkst_title_template.cfm">
		
		<!--- DISPLAY CONTENTS OF REPORT --->		
		<cfset totalrecords = 11><!--- The recordcount of the query + 1 for the column headers --->
		<cfset static_rows_used = 7><!--- How many rows were used for the title? --->					
		<cfset wkst_col_list = "Claim Number,Group Number,Last Name,First Name,Date First Reported,Effective Date,Offset Savings,RGCO">

		<cfinclude template="dsp_excel_report_contents_template.cfm">
		
		<!--- assign_sheet.Range(chr(65) & "4").ColumnWidth = 5 --->
		
<!--- END WORKSHEET CODE --->
		
		<!--- SET THE PRINT FORMATTING UP. ie. Landscaped, page numbers and margins --->
		<cfinclude template="act_set_excel_print_format.cfm">
	End Sub	
	</script>
</head>

<body>
<input type="button" value="Automate Report To Excel" name="export_to_excel" onclick="makeFile()">


</body>
</html>
