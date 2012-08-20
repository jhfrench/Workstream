
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
	 || 
 --->
<cfset ignore_these="FIELDNAMES,fuseaction,MAKE_CHANGES,MODULE_ID,MODULE_LIST,OBJ_LIST">
</cfsilent>
<cftransaction isolation="READ_COMMITTED">
	<cfinclude template="qry_update_Security_Company_Access.cfm">
	<cfset application.team_changed=now()>
</cftransaction>

