
<!--Administration/qry_create_profile.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a user profile into the User_Profile table.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<cfif isdefined("attributes.primary_profile_ind")>
	<cfset variables.primary_profile_ind=1>
<cfelse>
	<cfset variables.primary_profile_ind=0>
</cfif>
<cfquery name="remove_primary" datasource="#application.datasources.main#">
UPDATE User_Profile
SET primary_profile_ind=0
WHERE primary_profile_ind=1
	AND user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
</cfquery>
<cfquery name="create_profile" datasource="#application.datasources.main#">
INSERT INTO User_Profile (user_account_id, primary_profile_ind, account_changed,
	company_id, company_name, company_select_list,
	last_loaded, profile_name,
	project_list_order, show_closed, show_closed_project_ind,
	show_on_hold, show_team, task_list_order)
VALUES (<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />,#variables.primary_profile_ind#,#createodbcdatetime(session.workstream_account_changed)#,
	'#session.workstream_company_id#','#session.workstream_company_name#','#session.workstream_selected_company_id#',
	#createodbcdatetime(session.workstream_last_loaded)#, '#attributes.profile_name#',
	#session.workstream_project_list_order#, #session.workstream_show_closed#, #session.show_closed_project_ind#,
	#workstream_show_on_hold#, #session.workstream_show_team#, '#session.workstream_task_list_order#')
</cfquery>
</cfsilent>