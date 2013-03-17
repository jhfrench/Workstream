
<!--Admin/act_save_profile.cfm
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
<cfinclude template="../common_files/qry_get_user_profile.cfm">
<cfif get_user_profile.recordcount>
	<cfinclude template="qry_delete_profile.cfm">
</cfif>
<cfinclude template="qry_create_profile.cfm">
</cfsilent>

