
<!--Reports/dsp_contractor_report.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the rows for the contractor report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>


<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Contractor's Report</h2></caption>
	<thead>
		<tr>
			<th><abbr title="Human Resources Identifier">HR ID</abbr></th>
			<th>Last Name</th>
			<th>First Name</th>
			<th>Status</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_contractor_report">
		<tr>
			<td scope="row">#user_account_id#</td>
			<td>#last_name#</td>
			<td>#first_name#</td>
			<td>#status#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>