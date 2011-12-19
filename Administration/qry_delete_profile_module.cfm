
<!--Admin/qry_delete_profile_module.cfm
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
<cfquery name="delete_profile_module" datasource="#application.datasources.main#">
DELETE module_access
FROM User_Profile
WHERE emp_id=#attributes.emp_id#
</cfquery>
</cfsilent>

