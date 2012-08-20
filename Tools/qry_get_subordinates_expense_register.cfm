
<!--Tools/qry_get_subordinates_expense_register.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the list of expenses to populate register at top of page.
	||
	Name: Jeromy French
	||
	Edits:
	 || 
	END FUSEDOC --->
<cfquery name="get_subordinates_expense_register" datasource="#application.datasources.main#">
SELECT Expense.expense_id, Expense.date_incurred, Expense.created_date,Expense.expense_status_id,
	COALESCE(Expense.date_accounting_approved, Expense.date_supervisor_approved) AS date_approved,
	Expense.payee_name, REF_Expense_Status.description,
	Expense.amount
FROM Expense
	INNER JOIN REF_Expense_Status ON Expense.expense_status_id=REF_Expense_Status.expense_status_id
	INNER JOIN Link_Employee_Supervisor ON Expense.emp_id=Link_Employee_Supervisor.user_account_id
WHERE Expense.date_deleted IS NULL
	AND Link_Employee_Supervisor.supervisor_id=#attributes.emp_id#
	AND Expense.date_incurred BETWEEN Link_Employee_Supervisor.date_start AND COALESCE(Link_Employee_Supervisor.date_end,CURRENT_TIMESTAMP)
	AND Expense.expense_status_id=1<!--- $issue$: should this be active_ind? --->
ORDER BY <cfif isdefined("attributes.order_by")>#attributes.order_by#<cfelse>Expense.date_incurred</cfif>
</cfquery>
</cfsilent>