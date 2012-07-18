
<!--Tools/qry_insert_optional_category.cfm
	Author: Damon S  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I insert optional categories into the database.
	||
	Name: Damon Scott
	||
	Edits:


	 
	 || 
	END FUSEDOC --->

<cfquery name="get_max_order_by" datasource="#application.datasources.main#">
SELECT MAX(order_by) AS order_by_number
FROM REF_Expense_Category
WHERE expense_category_id <> 18
</cfquery>

<cfset variables.order_by = get_max_order_by.order_by_number + 1>
<cfset variables.category_name = UCASE(LEFT(attributes.optional_new_category,1)) & RIGHT(attributes.optional_new_category, len(attributes.optional_new_category) - 1)>
<cfquery name="insert_optional_category" datasource="#application.datasources.main#">
INSERT INTO REF_Expense_Category (category, order_by, accounting_approval_ind,
		active_ind)
VALUES ('#variables.category_name#', #variables.order_by#, 0,
		1);
SELECT CURRVAL('REF_Expense_Category_expense_category_id_SEQ') AS expense_category_id
</cfquery>
<cfset variables.expense_category_id = insert_optional_category.expense_category_id>
</cfsilent>
