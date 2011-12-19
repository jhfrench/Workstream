
<!--Reports/dsp_expense_report_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:06:35  stetzer
<>

Revision 1.1  2001-10-11 11:04:44-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput query="get_expenses" group="reimbursement_type">
		<tr>
			<td class="SubHeadText#session.workstream_text_size#White" colspan="#colspan#" bgcolor="##0000ff">#reimbursement_type#</td>
		</tr>
		<tr bgcolor="##c0c0c0">
			<td class="RegText#session.workstream_text_size#">Name</td>
			<td class="RegText#session.workstream_text_size#">Date</td>
			<td class="RegText#session.workstream_text_size#">Code</td>
			<td class="RegText#session.workstream_text_size#">Description</td>
			<cfloop query="get_expense_type"><td class="RegText#session.workstream_text_size#">#Expense_Type#</td>
			<cfset totals[Expense_Type] = 0></cfloop>
			<td class="SubHeadText#session.workstream_text_size#">Totals:</td>
		</tr>
		<cfoutput>
		<cfset expense_id = get_expenses.expense_id> 
		<tr>
			<td class="RegText#session.workstream_text_size#">#name# #lname#</td>
			<td class="RegText#session.workstream_text_size#"><a href="javascript:expense('#expense_id#')">#dateFormat(work_date, 'mm/dd/yy')#</a></td>
			<td class="RegText#session.workstream_text_size#">#project_code#</td>
			<td class="RegText#session.workstream_text_size#">#trim(Description)#</td>
			<cfset currow = get_expenses.CurrentRow>
			<cfset rowtotal = 0>
			<cfset grandtotal = 0 >
			<cfloop query="get_expense_type"><td class="RegText#session.workstream_text_size#">#dollarFormat(get_expenses[expense_type][currow])#
<cfset rowtotal= rowtotal + get_expenses[expense_type][currow]>
<cfset totals[Expense_Type] =totals[Expense_Type] + get_expenses[expense_type][currow]></cfloop></td>
			<td class="RegText#session.workstream_text_size#">#dollarFormat(rowtotal)#</td>
		</tr>
		<tr bgcolor="##D5E4E6">
		<td class="RegText#session.workstream_text_size#" >Note:</td>
		<td colspan="#colspan#" class="RegText#session.workstream_text_size#">#note#</td>
		</tr>
		</cfoutput>	
		<tr>
			<td class="RegText#session.workstream_text_size#" colspan="4">Totals</td>
			<cfloop query="get_expense_type">
			<td class="RegText#session.workstream_text_size#">#dollarFormat(totals[Expense_Type])#</td>
			<cfset grandtotal=grandtotal + totals[Expense_Type]>
			</cfloop>
			<td class="SubHeadText#session.workstream_text_size#">#dollarformat(grandtotal)#</td>
		</tr>
	</cfoutput>
	
