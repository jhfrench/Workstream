
<!--Reports/dsp_employee_info_report.cfm
	Author: Joshua Peters  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the HTML formatted HR report
	||
	Name: Joshua Peters
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:06:01  stetzer
	<>

	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##c0c0c0" nowrap>	
		<!--- Loop over the list of header items. --->			
		<cfloop list="#attributes.report_elements#" index="header">
			
			<!--- Make sure this column hasn't been removed. --->
			<cfif NOT  ListContainsNoCase(attributes.columns_not_to_print,header)>
				<td class="RegText#session.workstream_text_size#Bd" nowrap>
					#header#
				</td>			
			</cfif>
					
		</cfloop>		
	</tr>	
	
	<cfloop query="get_employee_info">
	
		<tr<cfif NOT (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif> nowrap>		
		
		<!--- Merit Pool: Verify that this column hasn't been removed. --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Merit Pool")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#get_employee_info.merit_pool#</td>			
		</cfif>
		
		<!--- Dept --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Dept")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#get_employee_info.department_name#</td>			
		</cfif>
			
		<!--- Status --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Status")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>>>>Status<<<</td>			
		</cfif>
			
		<!--- EE Type --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"EE Type")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#get_employee_info.employee_classification#</td>			
		</cfif>
			
		<!--- PT Hours --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PT Hours")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#get_employee_info.Overtime#</td>			
		</cfif>
			
		<!--- Employee Name --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Employee Name")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#get_employee_info.employee#</td>			
		</cfif>
			
		<!--- Birth Date --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Birth Date")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#dateformat(get_employee_info.dob,'mm/dd/yyyy')#</td>			
		</cfif>
			
		<!--- Gender --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Gender")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>>>>Gender<<<<</td>			
		</cfif>
			
		<!--- Hire Date --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Hire Date")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#dateformat(get_employee_info.Hire_Date,'mm/dd/yyyy')#</td>			
		</cfif>
								
		<!--- Term Date --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Term Date")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#dateformat(get_employee_info.End_Date,'mm/dd/yyyy')#</td>			
		</cfif>
			
		<!--- Separation Code --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Separation Code")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#get_employee_info.Reason_ID#</td>			
		</cfif>
			
		<!--- Job Title --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Job Title")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#get_employee_info.title#</td>			
		</cfif>
			
		<!--- Job Date--->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Job Date")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#dateformat(get_employee_info.date_start,'mm/dd/yyyy')#</td>			
		</cfif>
			
		<!--- Manager --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Manager")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#get_employee_info.supervisor#</td>			
		</cfif>
			
		<!--- Latest Perform Level --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Latest Perform Level")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#get_employee_info.rating#</td>			
		</cfif>
			
		<!--- Annual Salary --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Annual Salary")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap><!--- #DollarFormat(decrypt(get_employee_info.salary, "sillyputty"))# ---></td>		
		</cfif>
			
		<!--- Salary Change Date --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Salary Change Date")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#dateformat(get_employee_info.date_implemented,'mm/dd/yyyy')#</td>			
		</cfif>
			
		<!--- % Inc --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"% Inc")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#decimalformat(decrypt(get_employee_info.increase_percent, "sillyputty"))#</td>			
		</cfif>
			
		<!--- Inc Type --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Inc Type")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#get_employee_info.salary_change_type#</td>			
		</cfif>
			
		<!--- Annual Inc Amt --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Annual Inc Amt")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#dollarformat(Decrypt(get_employee_info.increase_amount,"sillyputty"))#</td>			
		</cfif>
			
		<!--- Benefits Start Date --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Benefits Start Date")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#dateformat(get_employee_info.benefit_start_date,'mm/dd/yyyy')#</td>			
		</cfif>
			
		<!--- Med CVG --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Med CVG")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>>>>Med CVG<<<</td>			
		</cfif>
			
		<!--- PP Deduct Medical --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PP Deduct Medical")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>>>>PP Deduct Medical<<<</td>			
		</cfif>
			
		<!--- Den CVG --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Den CVG")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>>>>Den CVG<<<</td>			
		</cfif>
			
		<!--- PP Deduct Dental --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PP Deduct Dental")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>>>>PP Deduct Dental<<<</td>			
		</cfif>
			
		<!--- PP LTD Dental --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PP LTD Dental")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>>>>PP LTD Dental<<<</td>			
		</cfif>
			
		<!--- PP HCA Deduct 2002 --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PP HCA Deduct 2002")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>>>>PP HCA Deduct 2002<<<</td>			
		</cfif>
			
		<!--- PP DCA Deduct 2002 --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PP DCA Deduct 2002")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>>>>PP DCA Deduct 2002<<<</td>			
		</cfif>
			
		<!--- Flex Spending --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Flex Spending")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>>>>Flex Spending<<<</td>			
		</cfif>
			
		<!--- PP CSP Deduct --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"PP CSP Deduct")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>>>>PP CSP Deduct<<<</td>			
		</cfif>
			
		<!--- Metro Check Deduct --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Metro Check Deduct")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>>>>Metro Check Deduct<<<</td>			
		</cfif>
			
		<!--- Savings Bond Deduct --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Savings Bond Deduct")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>>>>Savings Bond Deduct<<<</td>			
		</cfif>
			
		<!--- Company --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Company")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#get_employee_info.Company#</td>			
		</cfif>
			
		<!--- Office --->
		<cfif NOT ListContainsNoCase(attributes.columns_not_to_print,"Office")>
			<td valign="top" class="RegText#session.workstream_text_size#" nowrap>#city#</td>			
		</cfif>
		
		</tr>
	</cfloop>
</cfoutput>