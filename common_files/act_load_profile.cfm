
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
 --->
<cfinclude template="qry_profile_lookup.cfm">
<cfscript>
	session.user_account_id=profile_lookup.emp_id;
	session.workstream_account_changed=profile_lookup.account_changed;
	session.workstream_company_id=profile_lookup.company_id;
	session.workstream_company_name=profile_lookup.company_name;
	session.workstream_selected_company_id=profile_lookup.company_select_list;
	session.workstream_emp_contact_type=1;
	session.workstream_express_input_rows=profile_lookup.express_input_rows;
	session.workstream_express_notes_height=profile_lookup.express_notes_height;
	session.workstream_express_notes_width=profile_lookup.express_notes_width;
	session.workstream_express_tree_height=profile_lookup.express_tree_height;
	session.workstream_last_loaded=profile_lookup.last_loaded;
	session.workstream_notes_display_sort=profile_lookup.notes_display_sort;
	session.workstream_project_list_order=profile_lookup.project_list_order;
	session.workstream_show_closed=profile_lookup.show_closed;
	session.workstream_show_closed_engagements=profile_lookup.show_closed_engagements;
	session.workstream_show_on_hold=profile_lookup.show_on_hold;
	session.workstream_show_options=profile_lookup.show_options;
	session.workstream_show_team=profile_lookup.show_team;
	session.workstream_task_list_order=profile_lookup.task_list_order;
	session.workstream_text_size=profile_lookup.text_size;
</cfscript>
</cfsilent>