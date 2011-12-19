
<!--Tools/qry_get_expense_category.cfm
	Author: Damon S  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the  different expense types for the expense form and the expense report.
	||
	Name: Damon Scott
	||
	Edits:
	||
	END FUSEDOC --->
<cfquery name="get_expense_category" datasource="#application.datasources.main#" >
SELECT REF_Expense_Category.category +  (CASE 
	WHEN REF_Expense_Category.sub_category IS NOT NULL THEN ' : ' + REF_Expense_Category.sub_category 
	ELSE '' END) AS description,
	REF_Expense_Category.expense_category_id
FROM REF_Expense_Category
WHERE REF_Expense_Category.expense_category_id IN 
	(SELECT expense_category_id
	FROM Expense
	WHERE Expense.date_deleted IS NULL
		AND Expense.emp_id=#session.workstream_emp_id#)
	OR (REF_Expense_Category.accounting_approval_ind=1
		AND REF_Expense_Category.active_ind=1)
ORDER BY order_by
</cfquery>
</cfsilent>
