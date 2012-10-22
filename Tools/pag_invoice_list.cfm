
<!--Tools/pag_invoice_list.cfm
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
<cfparam name="attributes.month" default="#month(now())#">
<cfparam name="attributes.year" default="#year(now())#">
</cfsilent>
<cfinclude template="../common_files/qry_get_extreme_dates.cfm">
<cfinclude template="qry_invoice_list.cfm">
<table class="table table-striped table-bordered table-condensed">
	<caption><h3>Project Invoice List</h3> <h5>for Work Completed in <cfoutput>#monthasstring(attributes.month)#, #attributes.year#</cfoutput></h5></caption>
	<thead>
	<cfinclude template="dsp_invoice_list_header.cfm">
	</thead>
	<tbody>
	<cfinclude template="dsp_invoice_list.cfm">
	</tbody>
</table>
<cfinclude template="dsp_invoice_list_form.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_details" fuseaction="Tools.invoice_details" field_name="project_id" processform="1" month="#attributes.month#" year="#attributes.year#">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_tasks" fuseaction="Timekeeping.task_list" field_name="project_id" field2_name="ignore_owner" field2_value="#attributes.month#|#attributes.year#">