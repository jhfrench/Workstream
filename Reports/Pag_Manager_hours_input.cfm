
<!--Reports/pag_Manager_hours_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the input screen for the Individual hours report.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfmodule template="../common_files/act_set_all_option.cfm" object_id="4">
<cfparam name="attributes.all_employees" default="0">
<cfif attributes.all_employees EQ 1>
	<cfset variables.all_employees_change=0>
<cfelse>
	<cfset variables.all_employees_change=1>
</cfif>
<cfif variables.all_option>
	<cfinclude template="../common_files/qry_team_select.cfm">
	<cfset variables.recordcount=team_select.recordcount>
<cfelse>
	<cfinclude template="../common_files/qry_get_subordinates.cfm">
	<cfset variables.recordcount=get_subordinates.recordcount>
</cfif>
</cfsilent>
<cfform name="report" action="index.cfm?fuseaction=Reports.manager_hours">
<table align="center" border="0" cellpadding="2" cellspacing="0" width="40%">
	<cfinclude template="dsp_manager_hours_input.cfm">
</table>
</cfform>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="all_employees" fuseaction="manager_hours_input" field_name="all_employees" field_value="#variables.all_employees_change#">
