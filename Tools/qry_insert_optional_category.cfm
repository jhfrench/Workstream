
<!--Tools/qry_insert_optional_category.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I insert optional categories into the database.
	||
	Name: Jeromy French
	||
	Edits:
	 ||
	END FUSEDOC --->
<!--- $issue$ is this template used? --->
<!--- $issue$ REF_Expense_Category does not exist in the database --->
<cfquery name="get_max_sort_order" datasource="#application.datasources.main#">
SELECT MAX(sort_order) AS sort_order_number
FROM REF_Expense_Category
</cfquery>

<cfset variables.sort_order=get_max_sort_order.sort_order_number + 1>
<cfset variables.category_name=ucase(left(attributes.optional_new_category,1)) & right(attributes.optional_new_category, len(attributes.optional_new_category) - 1)>

<cfquery name="insert_optional_category" datasource="#application.datasources.main#">
INSERT INTO REF_Expense_Category (category, sort_order, accounting_approval_ind,
		active_ind)
VALUES ('#variables.category_name#', #variables.sort_order#, 0,
		1)
RETURNING expense_category_id;
</cfquery>
<cfset variables.expense_category_id=insert_optional_category.expense_category_id>
</cfsilent>
