
<!--reports/qry_get_expense_types.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that gets the list of expense types that are being pulled for the expense report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

<cfquery name="get_Expense_Type" datasource="#application.datasources.main#">
SELECT REF_Expense_Type.Expense_Type, 
    REF_Expense_Type.Expense_type_ID
FROM expense_amount
	INNER JOIN expense ON expense_amount.expense_id = expense.expense_id
	INNER JOIN REF_Expense_Type ON expense_amount.Expense_type_id = REF_Expense_Type.Expense_type_ID
    WHERE (expense.work_date >='#From_Date#' AND expense.work_date <='#Through_Date#')
     <cfif compare(project_id, 0) or  isdefined("attributes.emp_id")>
	<cfif compare(project_id, 0) >and expense.project_id = #attributes.project_id#</cfif>
	<cfif isdefined("attributes.emp_id")>and expense.emp_id IN(#attributes.emp_id#)</cfif>
	<cfelse>
    and expense.emp_id = #session.user_account_id#
	</cfif>
GROUP BY expense_type, REF_expense_type.expense_type_id
ORDER BY REF_expense_type.expense_type_id
</cfquery>

</cfsilent>
