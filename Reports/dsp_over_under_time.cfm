
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

<h1>Over-/Under-Time Report</h1>
<cfoutput query="get_subordinates">
<cfinclude template="qry_get_under_over_hours.cfm">

<!--- $issue$: someday, this should key off number of expected hours per employee (not everyone is expected to work 40) --->
<cfif get_under_over_hours.recordcount>
<cfset variables.time_problem_ind=0>
<cfif get_under_over_hours_total.total_hours LT 35>
	<cfset variables.time_problem_ind=1>
	<cfset variables.row_class="error">
	<cfset variables.badge_class="icon-fire">
<cfelseif get_under_over_hours_total.total_hours LT 40>
	<cfset variables.time_problem_ind=1>
	<cfset variables.row_class="warning">
	<cfset variables.badge_class="icon-eye-open">
<cfelseif get_under_over_hours_total.total_hours GT 50>
	<cfset variables.time_problem_ind=1>
	<cfset variables.row_class="info">
	<cfset variables.badge_class="icon-briefcase">
</cfif>

<table class="table table-striped table-bordered table-condensed">
	<caption><h2>#get_subordinates.last_name#, #get_subordinates.first_name# <small>#get_under_over_hours.employee_classification#</small></h2></caption>
	<thead>
		<tr>
			<th>Project</th>
			<th>Hours</th>
		</tr>
	</thead>
	<tfoot>
		<tr<cfif variables.time_problem_ind> class="#variables.row_class#"</cfif>>
			<td>Total Hours</td>
			<td class="number"><cfif variables.time_problem_ind> <span class="badge badge-important"><i class="#variables.badge_class# icon-white"></i></span></cfif>#decimalformat(get_under_over_hours_total.total_hours)#</td>
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
	<button type="button" class="close" data-dismiss="alert">×</button>
	<strong>#get_subordinates.first_name# #get_subordinates.last_name#</strong> has no time entries for the specified dates.
</div>
</cfif>
</cfoutput>