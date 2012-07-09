
<!--Admin/qry_create_profile.cfm
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
	AND emp_id=#session.user_account_id#
</cfquery>
<cfquery name="create_profile" datasource="#application.datasources.main#">
INSERT INTO User_Profile (emp_id, primary_profile_ind, account_changed,
	company_id, company_name, company_select_list,
	express_input_rows, express_notes_height, express_notes_width,
	express_tree_height, first_name, last_loaded,
	last_name, profile_name, project_list_order,
	show_closed, show_closed_engagements, show_on_hold,
	show_options, show_team, text_size,
	notes_display_sort, task_list_order)
VALUES (#session.user_account_id#,#variables.primary_profile_ind#,#createodbcdatetime(session.workstream_account_changed)#,
	'#session.workstream_company_id#','#session.workstream_company_name#','#session.workstream_selected_company_id#',
	#session.workstream_express_input_rows#,#session.workstream_express_notes_height#,#session.workstream_express_notes_width#,
	#session.workstream_express_tree_height#,'#session.first_name#',#createodbcdatetime(session.workstream_last_loaded)#,
	'#session.last_name#','#attributes.profile_name#',
	#session.workstream_project_list_order#,#session.workstream_show_closed#,#session.workstream_show_closed_engagements#,
	#session.workstream_show_on_hold#,#session.workstream_show_options#,#session.workstream_show_team#,
	'#session.workstream_text_size#',#session.workstream_notes_display_sort#,'#session.workstream_task_list_order#')
</cfquery>
</cfsilent>

