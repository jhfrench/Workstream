
<!--Tools/pag_invoice.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the invoice tool invoice list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfparam name="attributes.step" default="1">
</cfsilent>

<!--- $issue$: need to add a section that shows all the charges that cannot be billed because of a missing Billing_Rate entry --->
<cfswitch expression="#attributes.step#">
	<cfcase value="1">
		<cfinclude template="qry_get_invoice_previous.cfm">
		<cfinclude template="qry_get_invoice_ready.cfm">
		<cfinclude template="qry_get_invoice_future.cfm">
		<h1>Invoicing List</h1>
		<div class="row-fluid">
			<div class="span6">
				<cfinclude template="dsp_invoice_ready.cfm">
			</div>
			<div class="span6">
				<cfinclude template="dsp_invoice_future.cfm">
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<cfinclude template="dsp_invoice_previous.cfm">
			</div>
		</div>
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="generate_invoice" fuseaction="Tools.generate_invoice" field_name="customer_id" process_form_ind="1" target="generate_invoice">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="get_invoice_detail1" fuseaction="#attributes.fuseaction#" field_name="invoice_id" field2_variable_ind="1" field2_name="customer_id" process_form_ind="1" step="2" current_month_ind="0">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="get_invoice_detail2" fuseaction="#attributes.fuseaction#" field_name="invoice_id" field2_variable_ind="1" field2_name="customer_id" process_form_ind="1" step="2" current_month_ind="0">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="get_invoice_detail3" fuseaction="#attributes.fuseaction#" field_name="invoice_id" field2_variable_ind="1" field2_name="customer_id" process_form_ind="1" step="2" current_month_ind="1">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="customer" fuseaction="Customers.projects" field_name="customer_id">
	</cfcase>
	<cfcase value="2">
		<cfinclude template="qry_get_invoice_detail.cfm">
		<cfinclude template="dsp_invoice_detail.cfm">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_project" fuseaction="Customers.edit_project" field_name="project_id">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="get_invoice_by_user_account" fuseaction="#attributes.fuseaction#" field_name="invoice_id" field2_variable_ind="1" field2_name="project_id" process_form_ind="1" step="3" current_month_ind="#attributes.current_month_ind#">
	</cfcase>
	<cfcase value="3">
		<cfif attributes.invoice_id>
			<cfset variables.field2_name="invoice_id">
		<cfelse>
			<cfset variables.field2_name="project_id">
		</cfif>
		<cfinclude template="qry_get_invoice_by_user_account.cfm">
		<cfinclude template="dsp_invoice_by_user_account.cfm">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="employee_details" fuseaction="Directory.employee_details" field_name="user_account_id">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="get_invoice_time_entry" fuseaction="#attributes.fuseaction#" field_name="user_account_id" field2_variable_ind="1" field2_name="#variables.field2_name#" process_form_ind="1" step="4" current_month_ind="#attributes.current_month_ind#">
	</cfcase>
	<cfcase value="4">
		<cfparam name="attributes.invoice_id" default="0">
		<cfparam name="attributes.customer_id" default="0">
		<cfinclude template="qry_get_invoice_time_entry.cfm">
		<cfinclude template="dsp_invoice_time_entry.cfm">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="employee_details" fuseaction="Directory.employee_details" field_name="user_account_id">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="time_entry_edit" fuseaction="Timekeeping.time_entry_edit" field_name="time_entry_id" process_form_ind="1" given_referer="#attributes.fuseaction#">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="task_details" fuseaction="Timekeeping.task_details" field_name="task_id">
	</cfcase>
</cfswitch>