
<!--Reports/qry_expense_types.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the reimbursement types and the different expense types for the expense form and the expense report.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery name="get_expense_category" datasource="#application.datasources.main#" >
SELECT  *
FROM REF_Expense_Category
ORDER BY order_by, expense_category_id
</cfquery>
</cfsilent>