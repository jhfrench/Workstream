
<!--Admin/qry_delete_profile.cfm
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
<cfquery name="delete_profile" datasource="#application.datasources.main#">
DELETE FROM User_Profile
WHERE emp_id=#variables.user_identification# 
	AND profile_name='#attributes.profile_name#'
</cfquery>
</cfsilent>
