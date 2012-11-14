
<!--Reports/dsp_expense_report_rows.cfm
	Author: Jeromy F -->
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
<cfoutput query="get_expenses" group="reimbursement_type">
		<tr>
			<td class="SubHeadTextWhite" colspan="#colspan#" bgcolor="##0000ff">#reimbursement_type#</td>
		</tr>
		<tr bgcolor="##c0c0c0">
			<td>Name</td>
			<td>Date</td>
			<td>Code</td>
			<td>Description</td>
			<cfloop query="get_expense_type"><td>#Expense_Type#</td>
			<cfset totals[Expense_Type] = 0></cfloop>
			<td class="SubHeadText">Totals:</td>
		</tr>
		<cfoutput>
		<cfset expense_id = get_expenses.expense_id> 
		<tr>
			<td>#name# #last_name#</td>
			<td><a href="javascript:expense('#expense_id#')">#dateformat(work_date, 'm/d/yyyy')#</a></td>
			<td>#project_code#</td>
			<td>#trim(Description)#</td>
			<cfset currow = get_expenses.CurrentRow>
			<cfset rowtotal = 0>
			<cfset grandtotal = 0 >
			<cfloop query="get_expense_type"><td>#dollarformat(get_expenses[expense_type][currow])#
<cfset rowtotal= rowtotal + get_expenses[expense_type][currow]>
<cfset totals[Expense_Type] =totals[Expense_Type] + get_expenses[expense_type][currow]></cfloop></td>
			<td>#dollarformat(rowtotal)#</td>
		</tr>
		<tr bgcolor="##D5E4E6">
		<td >Note:</td>
		<td colspan="#colspan#">#note#</td>
		</tr>
		</cfoutput>
		<tr>
			<td colspan="4">Totals</td>
			<cfloop query="get_expense_type">
			<td>#dollarformat(totals[Expense_Type])#</td>
			<cfset grandtotal=grandtotal + totals[Expense_Type]>
			</cfloop>
			<td class="SubHeadText">#dollarformat(grandtotal)#</td>
		</tr>
	</cfoutput>

