
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
	DELETE User_Profile
	WHERE emp_id = #session.user_account_id# 
		AND profile_name='#attributes.profile_name#'
</cfquery>
</cfsilent>

