
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
Revision 1.1  2006/09/15 22:24:13  csy
<>

Revision 1.0  2006-08-16 09:31:55-04  csy
Initial revision

Revision 1.0  2005-02-15 15:27:18-05  daugherty
Initial revision

Revision 1.3  2002-03-08 16:43:47-05  long
added fields to ignore in the  output list.

Revision 1.2  2001-11-15 10:13:01-05  long
Changed the isolation level from Serializable to read_committed

Revision 1.1  2001-10-11 10:55:40-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
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

