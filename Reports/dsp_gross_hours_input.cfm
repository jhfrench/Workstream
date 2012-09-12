
<!--Report/dsp_Gross_hours_Input.cfm
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
<form action="index.cfm?fuseaction=Reports.gross_hours" method="POST" class="well form-inline">
	<fieldset>
		<legend><h4>Criteria</h4></legend>
			<label for="month">Month</label>
			<select name="month" id="month" size="1" class="span2">
				<cfloop from="1" to="12" index="month_ii">
					<option<cfif attributes.month EQ month_ii> selected="selected"</cfif>value="#month_ii#">#monthasstring(month_ii)#</option>
				</cfloop>
			</select>
			<label for="year">Year</label>
			<select name="year" id="year" size="1" class="span2">
				<cfloop from="2000" to="#year(now())#" index="year_num">
					<option value="#year_num#"<cfif attributes.year EQ year_num> selected="selected"</cfif>>#year_num#</option>
				</cfloop>
			</select>
			<label for="office_location">Office Location</label>
			<select name="office_location" id="office_location" size="1" class="span2">
				<option value="ALL">ALL</option><cfloop query="office_loc">
				<option value ="#office_location#">#office_location#</option></cfloop>
			</select>
			<label for="emp_id">Employee</label>
			<select name="emp_id" id="emp_id" size="1" class="span2"> 
				<option value="ALL">ALL</option><cfloop query="get_team_select">
				<option value="#emp_id#">#lname#, #name#</option></cfloop>
			</select>
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
	</fieldset>
</form>
</cfoutput>