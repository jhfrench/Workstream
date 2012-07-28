
<!--Reports/dsp_excel_auto.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I include all necessary information for the excel export.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfparam name="CURR_SHEET" DEFAULT="1">			<!--- WE KEEP TRACK OF WHAT WORKSHEET WE ARE AUTOMATING WITH THIS VARIABLE --->


<cfinclude template="qry_Get_reimbursement_types.cfm">

<cfset tab_names_list = "">
<cfoutput query="get_expenses">

	<cfset tab_names_list = " #valuelist(Get_reimbursement_types.Reimbursement_Type)#">	<!--- LIST ALL THE WKST TAB NAMES IN THE REPORT --->

</cfoutput>

<cfoutput>
	<cfset column_names_list = "Name, Date, Code, Description, Note, #valuelist(get_expense_type.expense_type)#, Total">
	<cfset cols_needed_count = "#ListLen(column_names_list)#">
</cfoutput>
<script language="vbscript">
	<cfinclude template="excel_constants.cfm">
	<cfinclude template="vbs_excel_custom_functions.cfm">

	Sub makeFile()
		Dim assign_sheet 	<!--- CURRENT WKST WE ARE WORKING WITH (OBJECT)--->
		Dim MyExcelChart	<!--- EXCEL APPLICATION (OBJECT) --->
		Dim wb				<!--- CURRENT WORKBOOK (OBJECT) --->
		Dim wkst_title		<!--- TEXT PRINTED AT TOP OF REPORT --->
		Dim title_ending_letter	<!--- Dynamically determine where the title should end colum wise --->
		dim last_content_letter
		Dim expense_cell_start
		Dim expense_cell_end
		Dim formula_cell

		<!--- BORDER CONSTANTS --->
		Const Bottom=9, Left=7, Right=10, Top=8, Horizontal=12, Vertical=11

		Set MyExcelChart = CreateObject("Excel.Application")
		set wb = MyExcelChart.workbooks.add
		MyExcelChart.Application.Visible = True

		<cfinclude template="act_build_excel_wkst_tabs.cfm">
		<cfset wkst_counter = 0>

		<cfloop query="Get_reimbursement_types">

			<cfoutput>
				<cfset current_type = "#reimbursement_type#">
				<cfset wkst_id = "#wkst_counter#">
			</cfoutput>

			<cfinclude template="dsp_excel_wkst_title_template.cfm">

			<cfset totalrecords = #get_expenses.recordcount# +1><!--- The recordcount of the query + 1 for the column headers --->
			<cfset static_rows_used = 7><!--- How many rows were used for the title? --->
			<cfset wkst_col_list = "#column_names_list#">

			<cfinclude template="dsp_excel_report_contents_template.cfm"> 
			<cfset wkst_counter = wkst_counter + 1>
			<cfset curr_sheet = curr_sheet + 1>

		</cfloop>

		<cfinclude template="act_set_excel_print_format.cfm">

	End Sub
</script>

<a href="#" onclick="makeFile()">Export Report To Excel</a>


