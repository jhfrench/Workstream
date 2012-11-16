
<!--Reports/dsp_over_under_date_select.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the overtime report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfoutput>
<cfform name="form_date_select" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="well form-inline">
<fieldset>
	<legend>Criteria</legend>
	<label for="date">For</label>
	<select name="date" name="date" onchange="document.forms[0].submit();">
		<cfloop from="0" to="#variables.go_back_to#" step="7" index="variables.ii">
		<cfset variables.value_date=dateadd("d", -variables.ii, variables.select_start_date)>
		<option value="#variables.value_date#"<cfif NOT comparenocase(dateformat(variables.start_date,"m/d/yyyy"), dateformat(variables.value_date,"m/d/yyyy"))> selected="selected"</cfif>>#dateformat(variables.value_date, "mmmm dd, yyyy")#-#dateformat(dateadd("d", 6, variables.value_date), "mmmm dd, yyyy")#</option>
		</cfloop>
	</select>
</fieldset>
</cfform>
</cfoutput>
