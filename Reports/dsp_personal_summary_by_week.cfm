
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
			<th>Hours</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_individual_hours_summary_by_week">
		<tr>
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