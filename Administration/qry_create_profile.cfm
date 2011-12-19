
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
	Revision 1.2  2006/09/15 22:26:22  csy
	<>

	Revision 1.0  2006-08-16 09:32:09-04  csy
	Initial revision

	Revision 1.1  2005-11-10 14:44:41-05  french
	Added notes_display_sort and task_list_order to profile feature. Task 37440

	Revision 1.0  2005-02-15 15:27:35-05  daugherty
	Initial revision
	||
 --->
<cfif isdefined("attributes.primary_profile")>
	<cfset variables.primary_profile=1>
<cfelse>
	<cfset variables.primary_profile=0>
</cfif>
<cfquery name="remove_primary" datasource="#application.datasources.main#">
UPDATE User_Profile
SET primary_profile=0
WHERE primary_profile=1
	AND emp_id=#session.user_account_id#
</cfquery>
<cfquery name="create_profile" datasource="#application.datasources.main#">
INSERT INTO User_Profile (emp_id,primary_profile,account_changed,
	company_id,company_name,company_select_list,
	express_input_rows,express_notes_height,express_notes_width,
	express_tree_height,first_name,last_loaded,
	last_name, profile_name,
	project_list_order,show_closed,show_closed_engagements,
	show_on_hold,show_options,show_team,
	text_size,notes_display_sort,task_list_order)
VALUES (#session.user_account_id#,#variables.primary_profile#,#createodbcdatetime(session.workstream_account_changed)#,
	'#session.workstream_company_id#','#session.workstream_company_name#','#session.workstream_company_select_list#',
	#session.workstream_express_input_rows#,#session.workstream_express_notes_height#,#session.workstream_express_notes_width#,
	#session.workstream_express_tree_height#,'#session.first_name#',#createodbcdatetime(session.workstream_last_loaded)#,
	'#session.last_name#','#attributes.profile_name#',
	#session.workstream_project_list_order#,#session.workstream_show_closed#,#session.workstream_show_closed_engagements#,
	#session.workstream_show_on_hold#,#session.workstream_show_options#,#session.workstream_show_team#,
	'#session.workstream_text_size#',#session.workstream_notes_display_sort#,'#session.workstream_task_list_order#')
</cfquery>
</cfsilent>

