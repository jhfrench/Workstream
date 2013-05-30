
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
<cfif isdefined("attributes.hours") AND listlen(attributes.hours) AND session.workstream_last_loaded NEQ attributes.last_loaded>
	<cfinclude template="act_upload_entries.cfm">
</cfif>
<cfinclude template="../common_files/act_client_vars.cfm">
<cfinclude template="../common_files/qry_get_date_locked.cfm">
<cfinclude template="../common_files/qry_get_valid_projects.cfm">

<cfparam name="session.workstream_expand" default="yes,yes,no">
<cfset variables.min_date=dateformat(get_date_locked.date_locked, "yyyy-mm-dd")>
<cfset variables.max_date=dateformat(dateadd("m", 2, get_date_locked.date_locked), "yyyy-mm-dd")>
<cfif NOT len(session.workstream_express_input_rows)>
	<cfset variables.workstream_express_input_rows=1>
<cfelse>
	<cfset variables.workstream_express_input_rows=session.workstream_express_input_rows>
</cfif>
<cfsavecontent variable="variables.select_work_item">
	<select name="project_id" size="1"><cfloop query="get_valid_projects">
		<option value="#project_id#">#display#</option></cfloop>
	</select>
</cfsavecontent>
<cfinclude template="qry_get_express_time_entries.cfm">

<cfinclude template="dsp_express_cftree.cfm">
<cfinclude template="dsp_express_input.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="time_entry_edit" field_name="time_entry_id" fuseaction="Timekeeping.time_entry_edit">