
<!--Tools/act_add_expense_entry.cfm
	Author: Damon Scott  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I add new expense entries.
	||
	Name: Damon Scott
	||
	Edits:
$

	 || 
	END FUSEDOC --->
</cfsilent>
<cfif len(attributes.optional_new_category)>
	<cfinclude template="qry_insert_optional_category.cfm">
</cfif>

<cfinclude template="qry_insert_expense_data.cfm">