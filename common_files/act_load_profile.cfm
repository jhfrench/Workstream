
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
<cfinclude template="qry_get_general_user_info.cfm">
	<cfscript>
		session.first_name=get_general_user_info.first_name;
		session.last_name=get_general_user_info.last_name;
		session.workstream_user_account_id=get_general_user_info.user_account_id;
		session.workstream_pto_accrual_type_id=get_general_user_info.pto_accrual_type_id;
		session.workstream_show_hours_data_ind=get_general_user_info.show_hours_data_ind; // This option helps us to decide if we should show the user "used hours" information
	</cfscript>
<cfinclude template="qry_profile_lookup.cfm">
<cfif profile_lookup.recordcount>
	<cfscript>
		variables.user_identification=profile_lookup.user_account_id;
		session.workstream_account_changed=profile_lookup.account_changed;
		session.workstream_company_id=profile_lookup.company_id;
		session.workstream_company_name=profile_lookup.company_name;
		session.workstream_selected_company_id=profile_lookup.company_select_list;
		session.account_type_id=1;
		session.workstream_express_input_rows=profile_lookup.express_input_rows;
		session.workstream_express_notes_height=profile_lookup.express_notes_height;
		session.workstream_express_notes_width=profile_lookup.express_notes_width;
		session.workstream_express_tree_height=profile_lookup.express_tree_height;
		session.workstream_last_loaded=profile_lookup.last_loaded;
		session.workstream_notes_display_sort=profile_lookup.notes_display_sort;
		session.workstream_project_list_order=profile_lookup.project_list_order;
		session.workstream_show_closed=profile_lookup.show_closed;
		session.workstream_show_closed_project_ind=profile_lookup.show_closed_project_ind;
		session.workstream_show_on_hold=profile_lookup.show_on_hold;
		session.workstream_show_options=profile_lookup.show_options;
		session.workstream_show_team=profile_lookup.show_team;
		session.workstream_task_list_order=profile_lookup.task_list_order;
	</cfscript>
<cfelse>
	<cfscript>
		session.workstream_account_changed="#now()#";
		session.workstream_company_id=get_general_user_info.company_id;
		session.workstream_company_name=valuelist(get_general_user_info.company_name);
		session.workstream_selected_company_id=valuelist(get_general_user_info.company_id);
		session.account_type_id=get_general_user_info.account_type_id;
		session.workstream_express_input_rows=5;
		session.workstream_express_notes_height=1;
		session.workstream_express_notes_width=40;
		session.workstream_express_tree_height=300;
		session.workstream_last_loaded="#now()#";
		session.workstream_notes_display_sort=1;
		session.workstream_project_list_order=1;
		session.workstream_show_closed=0;
		session.workstream_show_closed_project_ind=0;
		session.workstream_show_on_hold=0;
		session.workstream_show_options=1;
		session.workstream_show_team=0;
		session.workstream_task_list_order="task_id";
	</cfscript>
</cfif>
</cfsilent>