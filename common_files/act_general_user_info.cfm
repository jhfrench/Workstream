
<!--common_files/act_general_user_info.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the row of the customers screen, I provide managers with a link to edit the customer and allow a drill down to view any engagements below the customer level, if any exist.

	||
	Edits:
	$Log$
	||	 
	<-- session.workstream_account_changed: date that controls query caching for object navigation
	<-- session.workstream_company_id: id that identifies company of the user to workstream
	<-- session.workstream_company_name: string that contains company name of the user
	<-- session.workstream_selected_company_id: lit of company IDs that the user wishes to interact with
	<-- session.workstream_emp_id: number that identifies user to workstream
	<-- session.first_name: string that contains first name of the user
	<-- session.last_name: string that contains last name of the user
	<-- session.workstream_express_tree_height: number that sets the height of the cftree on the express entry form
	<-- session.workstream_express_input_rows: number that sets how many input rows are offered to the user on the express entry page.
	<-- session.workstream_express_notes_height: number that sets the height of the text area to input time entry notes.
	<-- session.workstream_express_notes_width: number that sets the width of the text area to input time entry notes.
	<-- session.workstream_show_closed: boolean that indicates whether or not to display tasks that have been previously completed.
	<-- session.workstream_show_on_hold: boolean that indicates whether or not to display tasks that are on hold.
	<-- session.workstream_show_options: boolean that indicates whether or not the user wishes to see the checkboxes that allow the user to show/not show tasks meeting particular conditions.
	<-- session.workstream_show_team: boolean that indicates whether or not to display tasks for which the user is a team member of.
	<-- session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	<-- session.workstream_prefix: the code prefix that the user's company uses for creating customer codes
	<-- session.workstream_display_chat:  this is a boolean value that determins if the chat tool is diaplayed
	<-- 'session.workstream_#PN#_user': this is a boolean Value that is used to tell workstream what products the user has access to.
	<-- session.workstream_PTO_Accrual_Type_ID: this is the type of PTO accrual the user has.
		END FUSEDOC --->

<cfinclude template="qry_general_user_info.cfm">
<!--These are the client variables that contain demographic details about the particular user-->
	<cfset session.workstream_company_id=general_user_info.company_id>
	<cfset session.workstream_company_name=valuelist(general_user_info.company_name)>
	<cfset session.workstream_pto_accrual_type_id=general_user_info.pto_accrual_type_id>
	<cfset session.workstream_emp_id=general_user_info.emp_id>
	<cfset session.workstream_show_hours_data_ind=general_user_info.show_hours_data_ind><!--- This option helps us to decide if we should show the user "used hours" information --->
	<cfset session.workstream_emp_contact_type=general_user_info.emp_contact_type>
	<cfset session.first_name=general_user_info.first_name>
	<cfset session.last_name=general_user_info.last_name>
	<cfset session.workstream_account_changed="#now()#">
<!--These are the client variables that contain numbers to customize the express time entry input screen-->
	<cfparam name="session.workstream_express_tree_height" default=300>
	<cfparam name="session.workstream_express_input_rows" default=5>
	<cfparam name="session.workstream_express_notes_height" default=1>
	<cfparam name="session.workstream_express_notes_width" default=40>
	<!--This is a variable that keeps user from re-entering timekeeping data by hitting the refresh button-->
		<cfparam name="session.workstream_last_loaded" default="#now()#">
<!--These are the client variables that contain numbers to customize the timekeeping module-->
	<cfparam name="session.workstream_show_closed" default=0>
	<cfparam name="session.workstream_show_closed_engagements" default=0>
	<cfparam name="session.workstream_show_on_hold" default=0>
	<cfparam name="session.workstream_show_options" default=1>
	<cfparam name="session.workstream_show_team" default=0>
<!--These are the client variables that customize the workstream user experience-->
	<cfset session.workstream_selected_company_id=valuelist(general_user_info.company_id)>
	<cfset session.workstream_text_size="Md">
	<cfset session.workstream_project_list_order=1>
	   <!-- These two variables are added to allow qry_create_profile to work -->
	<cfparam name="session.workstream_notes_display_sort" default=1>
	<cfparam name="session.workstream_task_list_order" default="task_id">
<cfinclude template="act_load_profile.cfm">
</cfsilent>

