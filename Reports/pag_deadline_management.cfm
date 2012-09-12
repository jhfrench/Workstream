
<!--Reports/pag_deadline_management.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Deadline Management Report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.last_month=dateadd("m",-1, now())>
<cfparam name="attributes.admin_month" default="#month(variables.last_month)#">
<cfparam name="attributes.admin_year" default="#year(variables.last_month)#">
<cfset attributes.date_linked="#attributes.admin_month#/1/#attributes.admin_year#">
</cfsilent>
<cfinclude template="../common_files/qry_get_subordinates.cfm">
<cfif get_subordinates.recordcount>
	<cfinclude template="../common_files/qry_get_extreme_dates.cfm">
	<cfinclude template="qry_get_deadline_management.cfm">
	<cfinclude template="dsp_deadline_management_form.cfm">
	<div class="row-fluid">
		<div class="span6">
			<cfinclude template="dsp_deadline_management_chart.cfm">
		</div>
		<div class="span6">
			graph goes here
			<!--- $issue$: change to canvas graph <cfinclude template="dsp_deadline_management_graph.cfm">--->
		</div>
	</div>
	<div class="row-fluid">
		<div class="span9">
			<cfinclude template="dsp_deadline_management_sub.cfm">
		</div>
	</div>
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="emp_id" fuseaction="Directory.employee_details">
	<cfif isdefined("attributes.hide_supervisor")>
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="change_month" fuseaction="#attributes.fuseaction#" field_name="admin_month" field2_variable_ind="1" field2_name="admin_year" processform="1" hide_supervisor="1">
	<cfelse>
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="change_month" fuseaction="#attributes.fuseaction#" field_name="admin_month" field2_variable_ind="1" field2_name="admin_year">
	</cfif>
<cfelse>
<div class="alert alert-info">
	There is no data available for this report. 
</div>
</cfif>