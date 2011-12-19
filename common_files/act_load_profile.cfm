
<!--common_files/act_load_profile.cfm
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfinclude template="qry_profile_lookup.cfm">
<cfoutput query="profile_lookup">
	<cfset session.user_account_id=emp_id>
	<cfset session.workstream_account_changed=account_changed>
	<cfset session.workstream_company_id=company_id>
	<cfset session.workstream_company_name=company_name>
	<cfset session.workstream_selected_company_id=company_select_list>
	<cfset session.workstream_emp_contact_type=1>
	<cfset session.workstream_express_input_rows=express_input_rows>
	<cfset session.workstream_express_notes_height=express_notes_height>
	<cfset session.workstream_express_notes_width=express_notes_width>
	<cfset session.workstream_express_tree_height=express_tree_height>
	<cfset session.workstream_last_loaded=last_loaded>
	<cfset session.workstream_notes_display_sort=notes_display_sort>
	<cfset session.workstream_project_list_order=project_list_order>
	<cfset session.workstream_show_closed=show_closed>
	<cfset session.workstream_show_closed_engagements=show_closed_engagements>
	<cfset session.workstream_show_on_hold=show_on_hold>
	<cfset session.workstream_show_options=show_options>
	<cfset session.workstream_show_team=show_team>
	<cfset session.workstream_task_list_order=task_list_order>
	<cfset session.workstream_text_size=text_size>
</cfoutput>
</cfsilent>

