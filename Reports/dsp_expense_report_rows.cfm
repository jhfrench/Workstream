
<!--Reports/dsp_expense_report_rows.cfm
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
<cfoutput query="get_expenses" group="reimbursement_type">
		<tr>
			<td class="SubHeadTextWhite" colspan="#colspan#" bgcolor="##0000ff">#reimbursement_type#</td>
		</tr>
		<tr bgcolor="##c0c0c0">
			<td class="RegText">Name</td>
			<td class="RegText">Date</td>
			<td class="RegText">Code</td>
			<td class="RegText">Description</td>
			<cfloop query="get_expense_type"><td class="RegText">#Expense_Type#</td>
			<cfset totals[Expense_Type] = 0></cfloop>
			<td class="SubHeadText">Totals:</td>
		</tr>
		<cfoutput>
		<cfset expense_id = get_expenses.expense_id> 
		<tr>
			<td class="RegText">#name# #lname#</td>
			<td class="RegText"><a href="javascript:expense('#expense_id#')">#dateFormat(work_date, 'mm/dd/yy')#</a></td>
			<td class="RegText">#project_code#</td>
			<td class="RegText">#trim(Description)#</td>
			<cfset currow = get_expenses.CurrentRow>
			<cfset rowtotal = 0>
			<cfset grandtotal = 0 >
			<cfloop query="get_expense_type"><td class="RegText">#dollarformat(get_expenses[expense_type][currow])#
<cfset rowtotal= rowtotal + get_expenses[expense_type][currow]>
<cfset totals[Expense_Type] =totals[Expense_Type] + get_expenses[expense_type][currow]></cfloop></td>
			<td class="RegText">#dollarformat(rowtotal)#</td>
		</tr>
		<tr bgcolor="##D5E4E6">
		<td class="RegText" >Note:</td>
		<td colspan="#colspan#" class="RegText">#note#</td>
		</tr>
		</cfoutput>	
		<tr>
			<td class="RegText" colspan="4">Totals</td>
			<cfloop query="get_expense_type">
			<td class="RegText">#dollarformat(totals[Expense_Type])#</td>
			<cfset grandtotal=grandtotal + totals[Expense_Type]>
			</cfloop>
			<td class="SubHeadText">#dollarformat(grandtotal)#</td>
		</tr>
	</cfoutput>
	
