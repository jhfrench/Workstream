
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
<cfset attributes.project_id=ListFirst(attributes.project_id,"|")>
<cfset attributes.month=ListFirst(attributes.drill_through,"|")>
<cfset attributes.year=listlast(attributes.drill_through,"|")>
</cfsilent>
<cfinclude template="qry_invoice_details.cfm">
<table class="table table-striped table-bordered table-condensed span8">
	<caption><h3>Invoice Details for <cfoutput>#invoice_details.project_name# Work Completed in #MonthAsString(attributes.month)#, #attributes.year#</cfoutput></h3></caption>
	<thead>
	<cfinclude template="dsp_invoice_details_header.cfm">
	</thead>
	<tbody>
	<cfinclude template="dsp_invoice_details.cfm">
	</tbody>
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_emp" field_name="emp_id" field2_name="ignore_owner" field2_value="#attributes.month#|#attributes.year#" fuseaction="Directory.employee_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="emp_to_notes" field_name="emp_id_project" field2_name="date" field2_value="#attributes.month#|#attributes.year#" fuseaction="Tools.invoice_notes_drill_down">