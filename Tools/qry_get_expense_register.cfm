
<!--Tools/qry_get_expense_register.cfm
	Author: Jeromy F  -->
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
<cfquery name="get_expense_register" datasource="#application.datasources.main#">
SELECT Expense.expense_id, Expense.date_incurred, Expense.created_date,Expense.expense_status_id,
	COALESCE(Expense.date_accounting_approved, Expense.date_supervisor_approved) AS date_approved,
	Expense.payee_name, REF_Expense_Status.description,
	Expense.amount
FROM Expense, REF_Expense_Status
WHERE Expense.expense_status_id=REF_Expense_Status.expense_status_id
	AND Expense.date_deleted IS NULL
	AND Expense.emp_id=#attributes.emp_id#
	AND Expense.date_incurred
	<cfif isdefined("attributes.begin_date") AND isdefined("attributes.end_date") AND  len(attributes.begin_date) AND len(attributes.end_date)>
		>= '#attributes.begin_date#' AND Expense.date_incurred <= '#attributes.end_date#'
	<cfelse>
		> CURRENT_TIMESTAMP-'90 day'
	</cfif>
	<cfif isdefined("attributes.expense_status_id") AND len(attributes.expense_status_id)>
		AND Expense.expense_status_id = #attributes.expense_status_id#
	</cfif>
ORDER BY <cfif isdefined("attributes.order_by")>#attributes.order_by#<cfelse>Expense.date_incurred</cfif>
</cfquery>
</cfsilent>
