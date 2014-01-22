
<!--Timekeeping/pag_express_entry.cfm
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
</cfsilent>
<cfif isdefined("attributes.hours") AND listlen(attributes.hours) AND session.workstream_last_loaded NEQ attributes.last_loaded>
	<cfinclude template="act_upload_entries.cfm">
</cfif>
<cfinclude template="../common_files/act_client_vars.cfm">
<cfinclude template="../common_files/qry_get_date_locked.cfm">
<cfinclude template="../common_files/qry_get_employee_details.cfm">

<cfset variables.partial_week=get_employee_details.week_hours*.75>
<cfset variables.full_day=get_employee_details.week_hours*.2>
<cfset variables.partial_day=get_employee_details.week_hours*.15>
<cfparam name="session.workstream_expand" default="yes,yes,no">
<cfset variables.min_date=dateformat(get_date_locked.date_locked, "yyyy-mm-dd")>
<cfset variables.max_date=dateformat(dateadd("m", 2, get_date_locked.date_locked), "yyyy-mm-dd")>
<cfif NOT len(session.workstream_express_input_rows)>
	<cfset variables.workstream_express_input_rows=1>
<cfelse>
	<cfset variables.workstream_express_input_rows=session.workstream_express_input_rows>
</cfif>
<cfsavecontent variable="variables.select_work_item">
	<select name="task_id" size="1" class="span12">
		<cfset variables.sort_order=0>
		<cfoutput query="get_express_task_list">
			<cfif variables.sort_order NEQ get_express_task_list.sort_order>
				<cfset variables.sort_order=get_express_task_list.sort_order>
				<cfswitch expression="#variables.sort_order#">
					<cfcase value="1">
						<cfset variables.optgroup_label="Your Tasks">
					</cfcase>
					<cfcase value="2">
						</optgroup>
						<cfset variables.optgroup_label="Team Tasks">
					</cfcase>
					<cfcase value="3">
						</optgroup>
						<cfset variables.optgroup_label="General Billing Codes">
					</cfcase>
					<cfdefaultcase>
						</optgroup>
						<cfset variables.optgroup_label="Undefined Grouping">
					</cfdefaultcase>
				</cfswitch>
				<optgroup label="#variables.optgroup_label#">
			</cfif>
			<option value="#task_id#">#task_name#</option>
		</cfoutput>
		</optgroup>
	</select>
</cfsavecontent>
<cfinclude template="qry_get_express_time_entries.cfm">

<cfinclude template="dsp_express_cftree.cfm">
<cfinclude template="dsp_express_input.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="time_entry_edit" field_name="time_entry_id" fuseaction="Timekeeping.time_entry_edit" process_form_ind="1" given_referer="#attributes.fuseaction#">
