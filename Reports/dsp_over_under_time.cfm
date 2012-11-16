
<!--Reports/dsp_over_under_time.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the results of the over/under time report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>

<h1>#attributes.report_title# Report</h1>
<cfloop query="get_subordinates">
<cfinclude template="qry_get_under_over_hours.cfm">
<cfif get_under_over_hours.recordcount>
<cfset variables.time_problem_ind=0>
<cfif (variables.overtime_ind AND get_under_over_hours_total.total_hours GT 40) OR (NOT variables.overtime_ind AND get_under_over_hours_total.total_hours LT 40)>
	<cfset variables.time_problem_ind=1>
</cfif>
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>#last_name#, #first_name# <small>#employee_classification#</small></h2></caption>
	<thead>
		<tr>
			<th>Project</th>
			<th>Hours</th>
		</tr>
	</thead>
	<tfoot>
		<tr<cfif variables.time_problem_ind> class="error"</cfif>>
			<td>Total Hours</td>
			<td class="number"><cfif variables.time_problem_ind> <span class="badge badge-important"><i class="icon-fire icon-white"></i></span></cfif>#decimalformat(get_under_over_hours_total.total_hours)#</td>
		</tr>
	</tfoot>
	<tbody>
	<cfloop query="get_under_over_hours">
		<tr>
			<td>#project_description#</td>
			<td class="number">#decimalformat(hours)#</td>
		</tr>
	</cfloop>
	</tbody>
</table>
<cfelse>
<div class="alert alert-error">
	#first_name# #last_name# has no time entries for the specified dates.
</div>
</cfif>
</cfloop>