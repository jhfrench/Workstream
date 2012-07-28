
<!--Reports/pag_expense_export.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>

<cfparam name="CURR_SHEET" DEFAULT="1"><!--- WE KEEP TRACK OF WHAT WORKSHEET WE ARE AUTOMATING WITH THIS VARIABLE --->

<cfparam name="from_date" default="1/1/01">
<cfparam name="through_date" default="7/30/02">
<cfparam name="project_id" default="0">
<cfinclude template="qry_Get_reimbursement_types.cfm">
<cfinclude template="../qry_get_expense_types.cfm">
<cfinclude template="../qry_get_expenses.cfm">
<cfset tab_names_list = "">
<cfoutput query="get_expenses">

	<cfset tab_names_list = " #valuelist(Get_reimbursement_types.Reimbursement_Type)#">	<!--- LIST ALL THE WKST TAB NAMES IN THE REPORT --->

</cfoutput>

<cfoutput>
	<cfset column_names_list = "Name, Date, Code, Description, #valuelist(get_expense_type.expense_type)#, Note,Total">
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

<input type="button" value="Automate Report To Excel" name="export_to_excel" onclick="makeFile()">

