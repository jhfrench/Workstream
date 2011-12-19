
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
	<-- session.workstream_engagement_edit: boolean that indicates if the user is allowed to edit engagements
	<-- session.workstream_customer_edit: I tell if the user is allowed to edit customers
	<-- session.workstream_user_level: this is used to tell us what level the user is, 1= Nucleus
	<-- session.workstream_PTO_Accrual_Type_ID: this is the type of PTO accrual the user has.
		END FUSEDOC --->

<cfinclude template="qry_general_user_info.cfm">
<!--- DON"T UNCOMMENT qry_get_product_access.cfm UNTIL PROCLAIM GOES LIVE!!! --->
<cfinclude template="qry_get_product_access.cfm"> 

<cfinclude template="qry_get_engagement_access.cfm">
<cfinclude template="qry_get_customer_access.cfm">
<!--These are the client variables that contain demographic details about the particular user-->
	<!---DON'T UNCOMMENT loop query="get_product_access" UNTIL PROCLAIM GOES LIVE --->
	<cfloop query="get_product_access">
		<cfset "session.workstream_#pn#_user"=true>
	</cfloop>
	<cfset session.workstream_alternate_datasource=general_user_info.alternate_datasource>
	<cfset session.workstream_authuser=session.user_name>
	<cfset session.workstream_company_id=general_user_info.company_id>
	<cfset session.workstream_company_name=valuelist(general_user_info.company_name)>
	<cfset session.workstream_pto_accrual_type_id=general_user_info.pto_accrual_type_id>
	<cfset session.workstream_display_chat=general_user_info.display_chat>
	<cfset session.workstream_emp_id=general_user_info.emp_id>
	<cfset session.workstream_show_hours_data_ind=general_user_info.show_hours_data_ind><!--- This option helps us to decide if we should show the user "used hours" information --->
	<cfset session.workstream_emp_contact_type=general_user_info.emp_contact_type>
	<cfset session.first_name=general_user_info.first_name>
	<cfset session.last_name=general_user_info.last_name>
	<cfset session.workstream_last_updated=createodbcdatetime(general_user_info.last_updated)>
	<cfset session.workstream_user_level=general_user_info.user_level>
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
	<!-- These are security variables that tell us if the user is allowed to edit customers and engagements-->
	<cfif get_engagement_access.recordcount AND NOT compare(get_engagement_access.active_ind, 1)>
		<cfset session.workstream_engagement_edit=1>
	<cfelse>
		<cfset session.workstream_engagement_edit=0>	

	</cfif>
	<cfif get_customer_access.recordcount AND NOT compare(get_customer_access.active_ind, 1)>
		<cfset session.workstream_customer_edit=1>
	<cfelse>
		<cfset session.workstream_customer_edit=0>
	</cfif>
	
	<!--- (4/11/03 Victor Added) 
	IF company uses password expiration, or their temp password expires as soon as they log in
	then app variable will be defined AND GT 0;
	if so we query the company security table to get this user's last_password_date, which
	is the last date they are allowed to use their current password; beyond that date they
	will be required to change it;
	we grab the date and put it into a client VAR of the same name and if there was non, we use todays date. ---><!--- 
<cfif application.password_expiration_in_days GT 0 OR application.temp_password_exps GT 0>
	<cfquery name="get_last_password_date" datasource="#application.datasources.main#">
		SELECT last_password_date
		FROM Security
		WHERE username='#auth_user#'
	</cfquery>
	<cfif get_last_password_date.recordcount GT 0>
		<cfif len(get_last_password_date.last_password_date)>
			<cfset session.workstream_last_password_date = get_last_password_date.last_password_date>
		<cfelse>
			<cfset session.workstream_last_password_date = dateformat(now(),'mm/dd/yyyy')>
		</cfif>
	</cfif>
</cfif> --->
	
<cfinclude template="act_load_profile.cfm">
</cfsilent>

