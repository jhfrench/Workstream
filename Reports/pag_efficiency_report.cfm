
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
<cfparam name="attributes.admin_month" default="#month(now())#">
<cfparam name="attributes.admin_year" default="#year(now())#">
<cfinclude template="act_efficiency_report.cfm">
<cfset variables.lowest_year=year(now())>
<cfset variables.temp_year=0>
</cfsilent>
<cfinclude template="act_change_month.cfm">

<cfoutput>
<form name="drill_down" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="well form-inline">
	<fieldset>
		#variables.project_name# Time for 
		<select name="admin_month">
			<cfloop from="1" to="12" index="ii">
			<option value="#ii#"<cfif attributes.admin_month EQ ii> selected="selected"</cfif>>#monthasstring(ii)#</option></cfloop>
		</select>
		<select name="admin_year">
			<cfloop from="#variables.lowest_year#" to="#year(now())#" index="ii">
			<option value="#ii#"<cfif attributes.admin_year EQ ii> selected="selected"</cfif>>#ii#</option></cfloop>
		</select>
		<label for="hide_supervisor">
			<input type="checkbox" name="hide_supervisor" id="hide_supervisor" value="1"<cfif isdefined("attributes.hide_supervisor")> checked="checked"</cfif> /> Remove your data
		</label>
		<input type="submit" name="submit" value="Go" class="btn btn-primary" />
	</fieldset>
</form>
</cfoutput>
<cfif (get_hier_2_id.hier_2_id NEQ 0 AND get_hier_2_id.hier_2_id LT 4) OR get_subordinates.recordcount>
	<cfinclude template="dsp_efficiency_report.cfm">
<cfelse>
	<cfmodule template="../common_files/dsp_section_title.cfm" align="center" colspan="3" gutter="0" section_color="ffffff" section_title="Your search returned no records." title_class="Note">
</cfif>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="emp_id" fuseaction="Directory.employee_details">

