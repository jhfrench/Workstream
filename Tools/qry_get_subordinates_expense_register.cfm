
<!--Tools/qry_get_subordinates_expense_register.cfm
	Author: Damon S  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the list of expenses to populate register at top of page.
	||
	Name: Damon Scott
	||
	Edits:
	||
	END FUSEDOC --->
<cfquery name="get_subordinates_expense_register" datasource="#application.datasources.main#">
SELECT Expense.expense_id, Expense.date_incurred, Expense.date_entered,Expense.expense_status_id,
	ISNULL(Expense.date_accounting_approved, Expense.date_supervisor_approved) AS date_approved,
	Expense.payee_name, REF_Expense_Status.description,
	Expense.amount
FROM Expense, REF_Expense_Status, Link_Employee_Supervisor
WHERE Expense.expense_status_id=REF_Expense_Status.expense_status_id
	AND Expense.date_deleted IS NULL
	AND Expense.emp_id=Link_Employee_Supervisor.emp_id
	AND Link_Employee_Supervisor.supervisor_id=#attributes.emp_id#
	AND Expense.date_incurred BETWEEN Link_Employee_Supervisor.date_start AND ISNULL(Link_Employee_Supervisor.date_end,GETDATE())
	AND Expense.expense_status_id=1
ORDER BY <cfif isdefined("url.order_by")>#url.order_by#<cfelse>Expense.date_incurred</cfif>
</cfquery>
</cfsilent>