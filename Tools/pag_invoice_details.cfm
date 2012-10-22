
<!--Tools/pag_invoice_details.cfm
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
<cfset attributes.billable_type_id=listlast(attributes.project_id,"|")>
<cfset attributes.project_id=listfirst(attributes.project_id,"|")>
<cfparam name="attributes.month" default="#month(now())#">
<cfparam name="attributes.year" default="#year(now())#">
</cfsilent>
<cfinclude template="qry_invoice_details.cfm">
<table class="table table-striped table-bordered table-condensed">
	<caption><h3>Invoice Details</h3> <h5>for <cfoutput>#invoice_details.project_name# (#invoice_details.project_code#)<br />Work Completed in #monthasstring(attributes.month)#, #attributes.year#</cfoutput></h5></caption>
	<thead>
	<cfinclude template="dsp_invoice_details_header.cfm">
	</thead>
	<cfinclude template="dsp_invoice_details.cfm">
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_emp" fuseaction="Directory.employee_details" field_name="emp_id" processform="1" month="#attributes.month#" year="#attributes.year#">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="emp_to_notes" fuseaction="Tools.invoice_notes_drill_down" field_name="emp_id_project" processform="1" month="#attributes.month#" year="#attributes.year#">