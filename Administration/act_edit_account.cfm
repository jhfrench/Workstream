
<!--Admin/act_edit_account.cfm
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
	||
 --->
<cfset ignore_these="FIELDNAMES,fuseaction,MAKE_CHANGES,MODULE_ID,MODULE_LIST,OBJ_LIST">
</cfsilent>
<cftransaction isolation="READ_COMMITTED">
	<cfinclude template="qry_delete_module_access.cfm">
	<cfinclude template="qry_delete_object_access.cfm">
	<cfinclude template="qry_insert_module_access.cfm">
	<cfinclude template="qry_insert_object_access.cfm">
	<cfinclude template="qry_update_last_changed.cfm">
	<cfset application.team_changed=now()>
</cftransaction>

