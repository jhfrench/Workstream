
<!--Reports/dsp_manager_hours_input.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the input screen for the Individual hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfmodule template="../common_files/act_set_all_option.cfm" business_function_id="644">
<cfparam name="attributes.all_employees" default="0">
<cfif variables.all_option>
	<cfinclude template="../common_files/qry_get_team_select.cfm">
	<cfset variables.recordcount=get_team_select.recordcount>
	<cfset variables.source_query_name="get_team_select">
<cfelse>
	<cfinclude template="../common_files/qry_get_subordinates.cfm">
	<cfset variables.recordcount=get_subordinates.recordcount>
	<cfset variables.source_query_name="get_subordinates">
</cfif>
<cfoutput>
<form name="report" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="well form-inline">
	<fieldset>
		<legend>Criteria</legend>
		<label for="from_date">From</label>
		<input type="date" name="from_date" id="from_date" value="#dateformat(attributes.from_date, 'yyyy-mm-dd')#" min="#application.application_specific_settings.workstream_start_date)#" max="#dateformat(now(), 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
		<label for="through_date">To</label>
		<input type="date" name="through_date" id="through_date" value="#dateformat(attributes.through_date, 'yyyy-mm-dd')#" min="#application.application_specific_settings.workstream_start_date)#" max="#dateformat(now(), 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
		<label for="through_date">Included Employees</label>
		<select name="included_user_account_id" required="required" multiple="yes" size="#min(variables.recordcount,25)#" class="span3">
			<cfloop query="#variables.source_query_name#">
			<option value="#user_account_id#" selected="selected">#display#</option>
			</cfloop>
		</select>
		<input type="submit" value="Update Report" class="btn btn-primary" />
	</fieldset>
</form>
</cfoutput>
