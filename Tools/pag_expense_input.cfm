
<!--Tools/pag_expense_input.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the page that holds the expense form insert page.
	||
	Name: Jeromy French
	||
	Edits:
	 || 
	END FUSEDOC --->

</cfsilent>
<cftransaction isolation="READ_COMMITTED">
	<cfinclude template="act_add_expense_entry.cfm">
</cftransaction>
<cflocation addtoken="No" url="index.cfm?fuseaction=expense_entry">
