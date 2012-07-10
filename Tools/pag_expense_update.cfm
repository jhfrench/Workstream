
<!--tools/pag_expense_update.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the code that allows  updates to the expense reports.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

</cfsilent>
<cfinclude template="../common_files/qry_expense_types.cfm">
<cftransaction isolation="READ_COMMITTED">
	<cfinclude template="act_del_expenses.cfm">
	<cfinclude template="act_insert_expenses.cfm">
</cftransaction>
<cflocation addtoken="No" url="index.cfm?fuseaction=home">
