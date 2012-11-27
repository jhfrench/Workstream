
<!--Tools/dsp_forceplanner_title_bar.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfset variables.colspan=decrementvalue(variables.colspan)>
</cfsilent>
<cfoutput>
<form name="form_forceplanner_criteria" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="well form-inline">
<fieldset>
	<legend>Criteria</legend>
	<label for="force_month">Month</label>
	<select name="force_month" id="force_month" onchange="form.submit();" class="span4">
	<cfloop from="1" to="12" index="ii"><option value="#ii#"<cfif ii EQ attributes.force_month> selected="selected"</cfif>>#monthasstring(ii)#</option>
	</cfloop>
	</select>
	<label for="force_year">Year</label>
	<select name="force_year" id="force_year" onchange="form.submit();" class="span4">
		<cfloop from="#get_years.min_year#" to="#get_years.max_year#" index="ii"><option value="#ii#"<cfif ii EQ attributes.force_year> selected="selected"</cfif>>#ii#</option>
	</cfloop>
	</select>
	<input type="submit" value="Update Report" class="btn btn-primary" />
</fieldset>
</form>
</cfoutput>