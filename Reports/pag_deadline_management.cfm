
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
<cfparam name="attributes.admin_month" default="#month(now())#">
<cfparam name="attributes.admin_year" default="#year(now())#">
<cfset attributes.date_linked="#attributes.admin_month#/1/#attributes.admin_year#">
</cfsilent>
<cfinclude template="../common_files/qry_get_subordinates.cfm">
<cfif get_subordinates.recordcount>
	<cfinclude template="../common_files/qry_get_extreme_dates.cfm"><!--- $issue$: need to SVN move Tools/qry_get_extreme_dates.cfm to common_files/--->
	<cfinclude template="qry_get_deadline_management.cfm">
	<h2>Deadline Management</h2>
	<div class="row-fluid">
		<div class="span6">
			<cfinclude template="dsp_deadline_management_chart.cfm">
		</div>
		<div class="span6">
			<cfinclude template="dsp_deadline_management_graph.cfm"><!--- $issue$: change to canvas graph --->
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<cfinclude template="dsp_deadline_management_sub.cfm">
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<cfinclude template="dsp_deadline_management_form.cfm">
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