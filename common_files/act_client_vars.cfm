
<!--common_files/act_client_vars.cfm
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
	--> [attributes.order_by]: string that contains the column to give ordering preference to
	--> [attributes.project_list_order]: number that corresponds to how the user wishes to order and display the project list pulldown
	--> [attributes.show_closed]: boolean that indicates the desire of the user to show tasks which have already been completed
	--> [attributes.show_on_hold]: boolean that indicates the desire of the user to show tasks which have been put on hold
	--> [attributes.show_team]: boolean that indicates the desire of the user to show tasks for which they are a member of the task team
	<-- session.workstream_show_closed: number that indicates the desire of the user to hide or show tasks which have already been completed; 1 means include the task, 0 means exclude the task
	<-- session.workstream_show_on_hold: number that indicates the desire of the user to hide or show tasks which have been put on hold; 1 means include the task, 0 means exclude the task
	<-- session.workstream_show_team: number that indicates the desire of the user to hide or show tasks for which they are a member of the task team; 1 means include the task, 0 means exclude the task
	<-- session.workstream_project_list_order: number that corresponds to how the user wishes to order and display the project list pulldown
 --->
<!--- $issue$: need to convert this into cfscript --->
<!--- TIMEKEEPING SETTINGS --->
	<cfif isdefined("attributes.evaluate_task_options")>
		<cfif isdefined("attributes.show_closed_project_ind")>
			<cfset session.workstream_show_closed_project_ind=1>
		<cfelse>
			<cfset session.workstream_show_closed_project_ind=0>
		</cfif>
		<cfif isdefined("attributes.show_closed")>
			<cfset session.workstream_show_closed=1>
		<cfelse>
			<cfset session.workstream_show_closed=0>
		</cfif>
		<cfif isdefined("attributes.show_on_hold")>
			<cfset session.workstream_show_on_hold=1>
		<cfelse>
			<cfset session.workstream_show_on_hold=0>
		</cfif>
		<cfif isdefined("attributes.show_team")>
			<cfset session.workstream_show_team=1>
		<cfelse>
			<cfset session.workstream_show_team=0>
		</cfif>
	</cfif>
	<cfif isdefined("attributes.expand_tree")>
		<cfset session.workstream_expand=attributes.expand_tree>
	</cfif>
	<cfif isdefined("attributes.express_tree_height")>
		<cfset session.workstream_express_tree_height=attributes.express_tree_height>
	</cfif>
	<cfif isdefined("attributes.express_input_rows")>
		<cfset session.workstream_express_input_rows=attributes.express_input_rows>
	</cfif>
	<cfif isdefined("attributes.express_notes_height")>
		<cfset session.workstream_express_notes_height=attributes.express_notes_height>
	</cfif>
	<cfif isdefined("attributes.express_notes_width")>
		<cfset session.workstream_express_notes_width=attributes.express_notes_width>
	</cfif>
<!--- APPLICATION SETTINGS --->
	<cfif isdefined("attributes.evaluate_app_options")>
		<cfif isdefined("attributes.company_select_list")>
			<cfset session.workstream_selected_company_id=listsort(attributes.company_select_list,"numeric")>
		<cfelse>
			<cfset session.workstream_selected_company_id=session.workstream_company_id>
		</cfif>
		<cfif isdefined("attributes.project_list_order")>
			<cfset session.workstream_project_list_order=attributes.project_list_order>
		</cfif>
	</cfif>
</cfsilent>