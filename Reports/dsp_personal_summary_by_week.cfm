
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
	<caption><h3>Summary of Hours by Week</h3></caption>
	<thead>
		<tr>
			<th>Week</th>
			<th>Hours</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_individual_hours_summary_by_week">
		<tr class="<cfif hours_worked GT get_employee_details.week_hours*1.1>info<cfelseif hours_worked LT get_employee_details.week_hours*0.9>warning</cfif>">
			<td>Week #work_week#</td>
			<td class="number">#decimalformat(hours_worked)#</td>
		</tr>
	</cfoutput>
	<tbody>
</table>
	</div>
	<div class="span4">
		<cfinclude template="dsp_personal_summary_by_week_graph.cfm"><!--- $issue$: change to canvas graph --->
	</div>
</div>