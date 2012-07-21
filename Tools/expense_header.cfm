<!--Tools/expense_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the header for the expense report
	||
	Name: Jeromy French
	||
	Edits:
	 || 
	END FUSEDOC --->
</cfsilent>
<tr>
	<td><a href="index.cfm?fuseaction=expense_entry&order_by=date_incurred">Expense Date</a></td>
	<td><a href="index.cfm?fuseaction=expense_entry&order_by=date_entered">Entry Date</a></td>
	<td><a href="index.cfm?fuseaction=expense_entry&order_by=date_approved">Approval Date</a></td>
	<td><a href="index.cfm?fuseaction=expense_entry&order_by=payee_name">Payee</a></td>
	<td>Status</td>
	<td><a href="index.cfm?fuseaction=expense_entry&order_by=amount">Amount</a></td>
</tr>