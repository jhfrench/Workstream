
<!--Timekeeping/pag_time_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the Timekeeping express entry page, and possibly include the act template that uploads the data to the database.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<cfset attributes.project_entry_ind="1">
</cfsilent>
<cfinclude template="act_validate_hours_js.cfm">
<cfif isdefined("attributes.hours") AND listlen(attributes.hours) AND session.workstream_last_loaded NEQ attributes.last_loaded>
	<cfinclude template="act_upload_entries.cfm">
</cfif>
<cfinclude template="../common_files/act_client_vars.cfm">
<cfinclude template="../common_files/qry_get_date_locked.cfm">
<cfinclude template="qry_get_express_time_entries.cfm">
<cfinclude template="../common_files/qry_get_valid_projects.cfm">

<cfif listlen(variables.not_numeric_entries)>
	<cfinclude template="dsp_express_not_numeric.cfm">
</cfif>
<cfinclude template="dsp_express_cftree.cfm">

<cfform name="myform" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST">
<table class="table table-striped table-bordered table-condensed">
	<caption><h2><em>-Express=</em> Time Entry</h2></caption>
	<thead>
		<tr>
			<th>Date</th>
			<th>Hours</th>
			<th><cfif compare(fuseaction, "time_entry")>Project<cfelse>Task</cfif></th>
			<th>Notes</th>
		</tr>
	</thead>
	<cfinclude template="dsp_time_entry_input_rows.cfm">
	<cfinclude template="dsp_express_entry_options.cfm">
</table>
</cfform>