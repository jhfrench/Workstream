
<!--Tools/qry_get_expense_status.cfm
	Author: Damon S  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get different expense statuses for the expense form and the expense report.
	||
	Name: Damon Scott
	||
	Edits:
	||
	END FUSEDOC --->
<cfquery name="get_expense_status" datasource="#application.datasources.main#">
SELECT *
FROM REF_Expense_Status
ORDER BY order_by
</cfquery>
</cfsilent>