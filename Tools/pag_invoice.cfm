
<!--Tools/pag_customer_invoice_list.cfm
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

<cfswitch expression="#attributes.step#">
	<cfcase value="1">
		<cfinclude template="qry_get_invoice_overview.cfm">
		<cfinclude template="dsp_invoice_overview.cfm">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="get_invoice_detail" fuseaction="#attributes.fuseaction#" field_name="invoice_id" field2_name="customer_id" processform="1" step="2">
	</cfcase>
	<cfcase value="2">
		<cfinclude template="qry_get_invoice_detail.cfm">
		<cfinclude template="dsp_invoice_detail.cfm">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="get_invoice_by_user_account" fuseaction="#attributes.fuseaction#" field_name="invoice_id" field2_name="project_id" processform="1" step="3">
	</cfcase>
	<cfcase value="3">
		<cfif attributes.invoice_id>
			<cfset variables.field_name="invoice_id">
		<cfelse>
			<cfset variables.field2_name="project_id">
		</cfif>
		<cfinclude template="qry_get_invoice_by_user_account.cfm">
		<cfinclude template="dsp_invoice_by_user_account.cfm">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="employee_details" fuseaction="Directory.employee_details" field_name="user_account_id">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="get_invoice_time_entry" fuseaction="#attributes.fuseaction#" field_name="user_account_id" field2_name="#variables.field_name#" processform="1" step="4">
	</cfcase>
	<cfcase value="4">
		<cfinclude template="qry_get_invoice_time_entry.cfm">
		<cfinclude template="dsp_invoice_time_entry.cfm">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="employee_details" fuseaction="Directory.employee_details" field_name="user_account_id">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="time_entry_edit" fuseaction="Timekeeping.time_entry_edit" field_name="time_entry_id">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="task_details" fuseaction="Timekeeping.task_details" field_name="task_id">
	</cfcase>
</cfswitch>