
<!--Admin/act_edit_auxiliary.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2006/07/05 17:26:40  french
	Initial revision.

	||
 --->
<cfset ignore_these="FIELDNAMES,fuseaction,MAKE_CHANGES,MODULE_ID,MODULE_LIST,OBJ_LIST">
</cfsilent>
<cftransaction isolation="READ_COMMITTED">
	<cfinclude template="qry_update_company_visible_to.cfm">
	<cfinclude template="qry_update_last_changed.cfm">
	<cfset application.team_changed=now()>
</cftransaction>

