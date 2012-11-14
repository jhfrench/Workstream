
<!--Report/dsp_form_month_location_employee.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<form id="form_month_location_employee" action="index.cfm?fuseaction=Reports.gross_hours" method="POST" class="well form-inline">
	<fieldset>
		<legend><h4>Criteria</h4></legend>
			<label for="work_month">Month</label>
			<select name="work_month" id="work_month" size="1" class="span2">
				<cfloop from="1" to="12" index="variables.month_ii">
					<option<cfif attributes.work_month EQ variables.month_ii> selected="selected"</cfif> value="#variables.month_ii#">#monthasstring(variables.month_ii)#</option>
				</cfloop>
			</select>
			<label for="work_year">Year</label>
			<select name="work_year" id="work_year" size="1" class="span2">
				<cfloop from="2000" to="#year(now())#" index="variables.year_num">
					<option value="#year_num#"<cfif attributes.work_year EQ variables.year_num> selected="selected"</cfif>>#variables.year_num#</option>
				</cfloop>
			</select>
			<label for="office_location">Office Location</label>
			<select name="office_location" id="office_location" size="1" class="span2">
				<option value="ALL">ALL</option><cfloop query="office_loc">
				<option value="#office_location#">#office_location#</option></cfloop>
			</select>
			<label for="user_account_id">Employee</label>
			<select name="user_account_id" id="user_account_id" size="1" class="span2"> 
				<option value="ALL">ALL</option><cfloop query="get_team_select">
				<option value="#user_account_id#">#display#</option></cfloop>
			</select>
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
	</fieldset>
</form>
</cfoutput>