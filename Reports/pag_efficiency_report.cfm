
<!--Reports/pag_efficiency_report.cfm
	Author: Jeromy F  -->
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
<cfset lowest_year=year(now())>
<cfset temp_year=0>
</cfsilent>
<cfinclude template="act_change_month.cfm">

<cfoutput>
<form name="drill_down" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="well form-inline">
	<fieldset>
		<div class="control-group">
			<div class="controls">
			</div>
		</div>
		#variables.project_name# Time for 
		<select name="admin_month" onchange="javascript:document.drill_down.submit();">
			<cfloop from="1" to="12" index="ii">
			<option value="#ii#"<cfif attributes.admin_month EQ ii> selected="selected"</cfif>>#monthAsString(ii)#</option></cfloop>
		</select>
		<select name="admin_year" onchange="javascript:document.drill_down.submit();">
			<cfloop from="#lowest_year#" to="#year(now())#" index="ii">
			<option value="#ii#"<cfif attributes.admin_year EQ ii> selected="selected"</cfif>>#ii#</option></cfloop>
		</select>
		<label for="hide_supervisor">
			<input type="Checkbox"<cfif isdefined("attributes.hide_supervisor")> checked="checked"</cfif> name="hide_supervisor" value="1" onclick="javascript:document.drill_down.submit();" id="hide_supervisor" class="SubHeadTextWhite" /> Remove your data
		</label>
	</fieldset>
</form>
</cfoutput>
<cfif (get_hier_2_id.hier_2_id NEQ 0 AND get_hier_2_id.hier_2_id LT 4) OR get_subordinates.recordcount>
	<cfinclude template="dsp_efficiency_report.cfm">
<cfelse>
	<cfmodule template="../common_files/dsp_section_title.cfm" align="center" colspan="3" gutter="0" section_color="ffffff" section_title="Your search returned no records." title_class="Note">
</cfif>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="emp_id" fuseaction="Directory.employee_details">

