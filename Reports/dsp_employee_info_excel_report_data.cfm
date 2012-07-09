
<!--- Reports/dsp_employee_info_excel_report_data.cfm
	Author: Joshua Peters  --->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the data displayed in the HR excel report.
	||
	Name: Joshua Peters
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<!--- Loop over our dataset. --->
	<cfloop query="get_employee_info">
		<!--- Keep track of column so we can dynamically keep track of where we are. --->
		<cfset variables.current_col_num=0>
		
		<!--- Merit Pool: Verify that this column hasn't been removed. --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Merit Pool")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#get_employee_info.merit_pool#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
		
		<!--- Dept --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Dept")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#get_employee_info.department_name#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Status --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Status")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>Status<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- EE Type --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"EE Type")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#get_employee_info.employee_classification#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- PT Hours --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PT Hours")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#get_employee_info.Overtime#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Employee Name --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Employee Name")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#get_employee_info.employee#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Birth Date --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Birth Date")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#dateformat(get_employee_info.dob,'mm/dd/yyyy')#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Gender --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Gender")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>Gender<<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Hire Date --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Hire Date")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#dateformat(get_employee_info.hire_date,'mm/dd/yyyy')#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
								
		<!--- Term Date --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Term Date")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#dateformat(get_employee_info.end_date,'mm/dd/yyyy')#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Separation Code --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Separation Code")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#get_employee_info.Reason_ID#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Job Title --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Job Title")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#get_employee_info.title#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Job Date--->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Job Date")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#dateformat(get_employee_info.date_start,'mm/dd/yyyy')#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Manager --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Manager")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#get_employee_info.supervisor#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Latest Perform Level --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Latest Perform Level")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#get_employee_info.rating#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Annual Salary --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Annual Salary")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#dollarformat(Decrypt(get_employee_info.salary,"sillyputty"))#"	<!---  --->		
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Salary Change Date --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Salary Change Date")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#dateformat(get_employee_info.date_implemented,'mm/dd/yyyy')#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- % Inc --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"% Inc")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>% Inc<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Inc Type --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Inc Type")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#get_employee_info.salary_change_type#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Annual Inc Amt --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Annual Inc Amt")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#dollarformat(Decrypt(get_employee_info.increase_amount,'sillyputty'))#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Benefits Start Date --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Benefits Start Date")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#dateformat(get_employee_info.benefit_start_date,'mm/dd/yyyy')#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Med CVG --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Med CVG")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>Med CVG<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- PP Deduct Medical --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PP Deduct Medical")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>PP Deduct Medical<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Den CVG --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Den CVG")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>Den CVG<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- PP Deduct Dental --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PP Deduct Dental")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>PP Deduct Dental<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- PP LTD Dental --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PP LTD Dental")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>PP LTD Dental<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- PP HCA Deduct 2002 --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PP HCA Deduct 2002")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>PP HCA Deduct 2002<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- PP DCA Deduct 2002 --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PP DCA Deduct 2002")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>PP DCA Deduct 2002<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Flex Spending --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Flex Spending")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>Flex Spending<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- PP CSP Deduct --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PP CSP Deduct")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>PP CSP Deduct<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Metro Check Deduct --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Metro Check Deduct")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>Metro Check Deduct<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Savings Bond Deduct --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Savings Bond Deduct")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>Savings Bond Deduct<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Company --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Company")>
			data_array(#variables.rownum#,#variables.current_col_num#)="#get_employee_info.Company#"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
			
		<!--- Office --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Office")>
			data_array(#variables.rownum#,#variables.current_col_num#)=">>>Office<<<"			
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
		
		<cfset variables.rownum = variables.rownum + 1>
	</cfloop>
</cfoutput>