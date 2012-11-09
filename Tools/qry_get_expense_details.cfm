
<!--Tools/qry_get_expense_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the details for a specific expense.
	||
	Name: Jeromy French
	||
	Edits:
	 || 
	END FUSEDOC --->
<cfquery name="get_expense_details" datasource="#application.datasources.main#" >
SELECT Expense.accounting_approval_memo, Expense.amount, Expense.client_billable_ind, 
	Expense.date_accounting_approved, Expense.created_date, Expense.date_incurred, 
	Expense.date_supervisor_approved, Expense.user_account_id, Expense.expense_category_id, 
	Expense.expense_id, Expense.expense_note, Expense.expense_status_id, 
	Expense.paid_by_id, Expense.payee_name, Expense.project_id, 
	Expense.supervisor_approval_user_account_id, Expense.supervisor_approval_memo
FROM Expense
WHERE Expense.expense_id=<cfif isdefined("attributes.expense_id")>#attributes.expense_id#<cfelse>#attributes.expense_id#</cfif>
</cfquery>
</cfsilent>
