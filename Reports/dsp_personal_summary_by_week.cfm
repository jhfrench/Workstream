
<!--Reports/dsp_personal_summary_by_week.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the a month's hours aggregated by project and week.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<div class="row-fluid">
	<div class="span8">
<table class="table table-striped table-bordered table-condensed">
	<caption><h3>Summary of Hours by Week &amp; Employee</h3></caption>
	<thead>
		<tr>
			<th>Week</th>
			<th><cfif variables.show_details_ind>Total </cfif>Hours</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="Agg_hours_by_week">
		<tr>
			<td><cfif variables.show_details_ind>#month#/#year# </cfif>Week #week#</td>
			<td class="number">#decimalformat(sumofhours)#</td>
		</tr>
	</cfoutput>
	<tbody>
</table>
	</div>
	<div class="span4">
		<cfif NOT variables.show_details_ind>
			<cfinclude template="dsp_personal_summary_by_week_graph.cfm"><!--- $issue$: change to canvas graph --->
		</cfif>
	</div>
</div>

<cfoutput>
<cfform name="personal_summary" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="well form-inline">
	<label for="month">Month</label>
	<select name="month" id="month">
	<cfloop from="1" to="12" index="month_ii">
		<option value="#month_ii#"<cfif attributes.month EQ month_ii> selected="selected"</cfif>>#monthasstring(month_ii)#</option>
	</cfloop>
	</select>
	<label for="year">Year</label>
	<select name="year" id="year">
		<cfloop from="1999" to="#year(now())#" index="ii">
		<option value="#ii#"<cfif attributes.year EQ ii> selected="selected"</cfif>>#ii#</option>
		</cfloop>
	</select>
	<input type="hidden" name="emp_id" value="#attributes.emp_id#" />
	<input type="submit" value="change date" class="btn btn-primary" />
</cfform>
</cfoutput>