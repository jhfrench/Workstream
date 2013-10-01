
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
		session.account_type_id=get_general_user_info.account_type_id;
		session.first_name=get_general_user_info.first_name;
		session.last_name=get_general_user_info.last_name;
		session.workstream_pto_accrual_type_id=get_general_user_info.pto_accrual_type_id;
		session.workstream_show_hours_data_ind=get_general_user_info.show_hours_data_ind; // This option helps us to decide if we should show the user "used hours" information
	</cfscript>
<cfinclude template="qry_get_user_profile.cfm">
<cfif get_user_profile.recordcount>
	<cfscript>
		variables.user_identification=get_user_profile.user_account_id;
		session.workstream_account_changed=get_user_profile.account_changed;
		session.workstream_company_id=get_user_profile.company_id;
		session.workstream_company_name=get_user_profile.company_name;
		session.workstream_selected_company_id=get_user_profile.company_select_list;
		session.workstream_express_input_rows=get_user_profile.express_input_rows;
		session.workstream_express_tree_height=get_user_profile.express_tree_height;
		session.workstream_last_loaded=get_user_profile.last_loaded;
		session.workstream_project_list_order=get_user_profile.project_list_order;
		session.workstream_show_closed=get_user_profile.show_closed;
		session.workstream_show_closed_project_ind=get_user_profile.show_closed_project_ind;
		session.workstream_show_on_hold=get_user_profile.show_on_hold;
		session.workstream_show_team=get_user_profile.show_team;
		session.workstream_task_list_order=get_user_profile.task_list_order;
	</cfscript>
<cfelse>
	<cfscript>
		session.workstream_account_changed="#now()#";
		session.workstream_company_id=get_general_user_info.company_id;
		session.workstream_company_name=get_general_user_info.company_name;
		if (get_general_user_info.account_type_id EQ 2) {
			session.workstream_selected_company_id=listappend(get_link_customer_company.company_id,1);
		}
		else {
			session.workstream_selected_company_id=get_link_customer_company.company_id;
		};
		session.workstream_express_input_rows=5;
		session.workstream_express_tree_height=300;
		session.workstream_last_loaded="#now()#";
		session.workstream_project_list_order=1;
		session.workstream_show_closed=0;
		session.workstream_show_closed_project_ind=0;
		session.workstream_show_on_hold=0;
		session.workstream_show_team=0;
		session.workstream_task_list_order="task_id";
	</cfscript>
</cfif>
</cfsilent>