
<!--Tools/pag_expense_input.cfm
	Author: Damon S  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the page that holds the expense form insert page.
	||
	Name: Damon Scott
	||
	Edits:


	 
	||
	END FUSEDOC --->

</cfsilent>
<cftransaction isolation="READ_COMMITTED">
	<cfinclude template="act_add_expense_entry.cfm">
</cftransaction>
<cflocation addtoken="No" url="index.cfm?fuseaction=expense_entry">
