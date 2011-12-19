
<!--tools/pag_expense_update.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the code that allows  updates to the expense reports.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 21:01:38  daugherty
Initial revision

Revision 1.2  2001-11-15 10:13:02-05  long
Changed the isolation level from Serializable to read_committed

Revision 1.1  2001-10-11 10:54:17-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

</cfsilent>
<cfinclude template="../common_files/qry_expense_types.cfm">
<cftransaction isolation="READ_COMMITTED">
	<cfinclude template="act_del_expenses.cfm">
	<cfinclude template="act_insert_expenses.cfm">
</cftransaction>
<cflocation addtoken="No" url="index.cfm?fuseaction=home">
