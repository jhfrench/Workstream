
<!-- Reports\excel_temp\dsp_excel_report_contents_template.cfm
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
	Revision 1.1  2005/03/09 18:10:01  stetzer
	<>

	Revision 1.1  2001-10-11 13:02:35-04  long
	Added FuseDoc

	||
	Variables:
	
	END FUSEDOC --->
</cfsilent><!--- dsp_excel_report_contents_template.cfm --->
<cfoutput>
	<cfset num_of_cols = "#ListLen(wkst_col_list ,",")#">
	<cfset curr_col = 0>
	<cfset rownum = 0>
	<cfset begin_data_row = static_rows_used>
	<cfset STARTROW = totalrecords>
	<cfset totals = StructNew()>


	<!--- BUILD MULTI-D ARRAY FOR POPULATING REPORT --->
	dim arr_#wkst_id#( #totalrecords#,#num_of_cols#) 
	dim rng_#wkst_id# 
	set rng_#wkst_id# = assign_sheet.Range("A#begin_data_row#:A#num_of_cols#").Resize(#STARTROW#,#num_of_cols#)
</cfoutput>	

	<!--- ADD COLUMN HEADERS VIA PASSED LIST --->	
	<cfloop INDEX="col_value" LIST="#wkst_col_list#" DELIMITERS=",">		
		<cfoutput>
	 	arr_#wkst_id#(#rownum#,#curr_col#) = "#col_value#"
		<cfset curr_col = curr_col + 1>
		</cfoutput>	
	</cfloop>
	
	<cfset curr_col = 0>
	<cfset rownum = rownum + 1> 

	<cfoutput query="get_expenses">

		<cfif NOT CompareNoCase(current_type, get_expenses.reimbursement_type)>

		<!--- <cfoutput> --->
			
			<cfset expense_id = get_expenses.expense_id> 
			
			arr_#wkst_id#(#rownum#,#curr_col#) = "#name# #lname#"
			<cfset curr_col = curr_col + 1>
			
			arr_#wkst_id#(#rownum#,#curr_col#) = "#dateFormat(work_date, 'mm/dd/yy')#"
			<cfset curr_col = curr_col + 1>
			
			arr_#wkst_id#(#rownum#,#curr_col#) = "#project_code#"			
			<cfset curr_col = curr_col + 1>
			
			arr_#wkst_id#(#rownum#,#curr_col#) = "#trim(Description)#"			
			<cfset curr_col = curr_col + 1>
			
			<cfset currow = get_expenses.CurrentRow>
			
			<cfloop query="get_expense_type">
				arr_#wkst_id#(#rownum#,#curr_col#) = "#dollarformat(get_expenses[expense_type][currow])#"				
				<cfset curr_col = curr_col + 1>
				
				<!--- <cfset totals[Expense_Type] =totals[Expense_Type] + get_expenses[expense_type][currow]> --->
			</cfloop>

			arr_#wkst_id#(#rownum#,#curr_col#) = "#note#"
			
			<cfset curr_col = curr_col + 1>
			
		<!--- </cfoutput> --->	

<!--- 			<cfloop query="get_expense_type">
				arr_#wkst_id#(#rownum#,#curr_col#) = "#dollarformat(totals[Expense_Type])#"				
				<cfset curr_col = curr_col + 1>
			</cfloop> --->
			<cfset rownum = rownum + 1> 
			<cfset curr_col = 0>
		</cfif>
	</cfoutput>
		
<cfoutput>

	<!--- Fill the worksheet all at once --->
	rng_#wkst_id#.value = arr_#wkst_id# 
	<!--- Increment to next worksheet --->
</cfoutput>