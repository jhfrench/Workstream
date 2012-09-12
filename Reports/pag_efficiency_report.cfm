
<!--Reports/pag_efficiency_report.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the efficiency report for the engagement that corresponds to what the user requests (as determined by the fuseaction).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.last_month=dateadd("m",-1, now())>
<cfparam name="attributes.admin_month" default="#month(variables.last_month)#">
<cfparam name="attributes.admin_year" default="#year(variables.last_month)#">
<cfinclude template="act_efficiency_report.cfm">
<cfset variables.lowest_year=year(now())>
<cfset variables.temp_year=0>
</cfsilent>
<cfinclude template="act_change_month.cfm">

<cfoutput>
<form name="drill_down" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="well form-inline">
	#variables.project_name# Time for 
	<label for="admin_month">Month</label>: 
	<select name="admin_month" id="" class="span2">
		<cfloop from="1" to="12" index="ii">
		<option value="#ii#"<cfif attributes.admin_month EQ ii> selected="selected"</cfif>>#monthasstring(ii)#</option></cfloop>
	</select>
	<label for="admin_year">Year</label>: 
	<select name="admin_year" id="" class="span2">
		<cfloop from="#variables.lowest_year#" to="#year(now())#" index="ii">
		<option value="#ii#"<cfif attributes.admin_year EQ ii> selected="selected"</cfif>>#ii#</option></cfloop>
	</select>
	<label for="hide_supervisor">
		<input type="checkbox" name="hide_supervisor" id="hide_supervisor" value="1"<cfif isdefined("attributes.hide_supervisor")> checked="checked"</cfif> /> Remove your data
	</label>
	<input type="submit" name="submit" value="Go" class="btn btn-primary" />
</form>
</cfoutput>
<cfif (get_hier_2_id.hier_2_id NEQ 0 AND get_hier_2_id.hier_2_id LT 4) OR get_subordinates.recordcount>
	<cfinclude template="dsp_efficiency_report.cfm">
<cfelse>
	<div class="alert alert-info">
		Your search returned no records.
	</div>
</cfif>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="emp_id" fuseaction="Directory.employee_details">