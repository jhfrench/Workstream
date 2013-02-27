
<!--Tools/pag_search_results.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the search output screen for workstream.
	||
	Name: 
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfscript>
	if (isdefined("attributes.header_search_criteria")) {
		if (isnumeric(attributes.header_search_criteria)) {
			attributes.task_id=attributes.header_search_criteria;
		}
		else {
			attributes.task_name=attributes.header_search_criteria;
		};
	};
	if (NOT isdefined("attributes.customer_id")) {
		attributes.customer_id="";
	};
	if (NOT isdefined("attributes.date_entered")) {
		attributes.date_entered="";
	};
	if (NOT isdefined("attributes.date_entered_operator")) {
		attributes.date_entered_operator="";
	};
	if (NOT isdefined("attributes.description")) {
		attributes.description="";
	};
	if (NOT isdefined("attributes.due_date")) {
		attributes.due_date="";
	};
	if (NOT isdefined("attributes.due_date_operator")) {
		attributes.due_date_operator="";
	};
	if (NOT isdefined("attributes.notes")) {
		attributes.notes="";
	};
	if (NOT isdefined("attributes.priority_id")) {
		attributes.priority_id="";
	};
	if (NOT isdefined("attributes.project_id")) {
		attributes.project_id="";
	};
	if (NOT isdefined("attributes.task_id")) {
		attributes.task_id="";
	};
	if (NOT isdefined("attributes.task_name")) {
		attributes.task_name="";
	};
	if (NOT isdefined("attributes.task_owner")) {
		attributes.task_owner="";
	};
	if (NOT isdefined("attributes.task_source")) {
		attributes.task_source="";
	};
	if (NOT isdefined("attributes.task_stati")) {
		attributes.task_stati="";
	};
	if (NOT isdefined("attributes.used_by_search_ind")) {
		attributes.used_by_search_ind=1;
	};
</cfscript>
</cfsilent>
<cfinclude template="../common_files/act_client_vars.cfm">
<cfinclude template="../common_files/act_task_list_order.cfm">
<cfinclude template="qry_get_search_results.cfm">

<cfif get_task_list.recordcount>
<table class="table table-striped table-bordered table-condensed">
	<caption><h2><cfoutput>#application.application_specific_settings.organization#</cfoutput> Knowledgebase Search Results</h2></caption>
	<cfinclude template="../common_files/dsp_task_list_header.cfm">
	<cfinclude template="../common_files/dsp_task_list.cfm">
</table>
<cfelse>
	<div class="alert alert-info">
		You have no tasks that meet your criteria.
	</div>
</cfif>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="order_by" field_name="order_by" fuseaction="output" process_form_ind="true" field2_name="reorder" field2_value="1">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_time" field_name="task_id" fuseaction="Timekeeping.time_details">

<cfoutput>
<form id="form_search_results_edit" action="index.cfm?fuseaction=Tools.search_criteria" method="POST">
	<input type="hidden" name="customer_id" value="#attributes.customer_id#" />
	<input type="hidden" name="date_entered" value="#attributes.date_entered#">
	<input type="hidden" name="date_entered_operator" value= "#attributes.date_entered_operator#">
	<input type="hidden" name="description" value= "#attributes.description#">
	<input type="hidden" name="due_date" value="#attributes.due_date#" />
	<input type="hidden" name="due_date_operator" value= "#attributes.due_date_operator#">
	<input type="hidden" name="notes" value="#attributes.notes#" />
	<input type="hidden" name="priority_id" value="#attributes.priority_id#" />
	<input type="hidden" name="project_id" value="#attributes.project_id#" />
	<input type="hidden" name="task_id" value="#attributes.task_id#">
	<input type="hidden" name="task_name" value="#attributes.task_name#" />
	<input type="hidden" name="task_owner" value="#attributes.task_owner#" />
	<input type="hidden" name="task_source" value="#attributes.task_source#">
	<input type="hidden" name="task_stati" value="#attributes.task_stati#" />
	<div class="btn-group">
		<input type="submit" value="Edit Search" class="btn" />
		<a href="index.cfm?fuseaction=Tools.search_criteria" class="btn">New Search</a>
	</div>
</form>
</cfoutput>
