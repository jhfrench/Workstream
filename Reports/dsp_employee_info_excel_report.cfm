
<!--Report/dsp_employee_info_excel_report.cfm
	Author: Joshua Peters  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I automate the HR report in Excel.
	||
	Name: Joshua Peters
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:05:52  stetzer
	<>

	||
	END FUSEDOC --->
</cfsilent>
<cfparam name="attributes.report_elements" default="Merit Pool,Dept,Status,EE Type,PT Hours,Employee Name,Birth Date,Gender,Hire Date,Term Date,Separation Code,Job Title,Job Date,Manager,Latest Perform Level,Annual Salary,Salary Change Date,% Inc,Inc Type,Annual Inc Amt,Benefits Start Date,Med CVG,PP Deduct Medical,Den CVG,PP Deduct Dental,PP LTD Dental,PP HCA Deduct 2002,PP DCA Deduct 2002,Flex Spending,PP CSP Deduct,Metro Check Deduct,Savings Bond Deduct,Company,Office">
<cfparam name="attributes.columns_not_to_print" default="">
	
<script language="vbscript">
	Sub makeFile()
		<!--- Curr_Sheet is our "toggle" value that determines which worksheet we want to work with based on it's sequence number. --->
		<cfset curr_sheet=1>
		<cfset variables.number_of_columns = listlen(attributes.report_elements)>
		<cfset variables.number_of_rows = get_employee_info.recordcount + 1>
		<cfset variables.rownum = 0>
		<cfset variables.current_col_num = 0>
		
		Dim assign_sheet
		Dim MyExcelChart
		Dim wb
		
		<!--- Create Object  --->
		Set MyExcelChart=CreateObject("Excel.Application")
		set wb=MyExcelChart.workbooks.add
		MyExcelChart.Application.Visible=False	
		set assign_sheet = MyExcelChart.Sheets(1)
		assign_sheet.name = "HR Report" 
		assign_sheet.Range("A1:AZ2").HorizontalAlignment =-4108
					
		<cfoutput>						
			dim data_array(#variables.number_of_rows#,#variables.number_of_columns#) 'CREATING MULTI-DIMENSIONAL ARRAY FOR DATA POST
			dim tt	

			<!--- Build column headers. --->
			<cfinclude template="dsp_employee_info_excel_report_column_headers.cfm">	
			
			<!--- Build report data. --->		
			<cfinclude template="dsp_employee_info_excel_report_data.cfm">				
			
			<cfset variables.number_of_rows = variables.rownum+variables.number_of_rows>
			dim rng							
			set rng = assign_sheet.Range("A1:AG#variables.number_of_rows#").Resize(#variables.rownum#,#variables.number_of_columns#)
			rng.value = data_array	

		</cfoutput> 
		
		<!--- This is the overall formatting of the spreadsheet. --->
		<cfinclude template="dsp_employee_info_report_excel_formatting.cfm">
					
		<cfoutput>
			assign_sheet.Range("A1").value="Employee Information Report - #dateformat(attributes.start_date,'mmmm dd, yyyy')#"
			assign_sheet.Range("A1:O1").MergeCells = True
			assign_sheet.Rows("1").Font.Bold = True	
			assign_sheet.Rows("1").Font.size = 18
			assign_sheet.Rows("1:1").RowHeight = 45			
		</cfoutput>
		
		MyExcelChart.Application.Visible=True	
		<!--- Destroy our Excel objects so the threads don't stay in the user's TSR's. --->
		Set MyExcelChart=Nothing
		Set wb=Nothing				
	End Sub
</script>
