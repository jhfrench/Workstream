
<!--Reports/dsp_personal_summary_by_code.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the a month's hours aggregated by project.
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
	<caption><h3>Summary of Hours by Client Code &amp; Employee</h3></caption>
	<thead>
		<tr>
			<th>Client Name</th>
			<th><cfif variables.show_details_ind>Total </cfif>Hours</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="agg_hours_by_month">
		<tr>
			<td>#clientname#</td>
			<td class="number">#decimalformat(sumofhours)#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
	</div>
	<div class="span4">
		Placeholder for pie graph just like the one on front page<!--- $issue$: reuse pie graph, and queries, from front page --->
	</div>
</div>
