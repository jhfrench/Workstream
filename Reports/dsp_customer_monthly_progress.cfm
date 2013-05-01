
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

<cfparam name="variables.project_id" default="0">
<cfparam name="variables.task_id" default="0">
<cfoutput query="get_customer_monthly_progress">
<cfif variables.project_id NEQ get_customer_monthly_progress.project_id>
	<cfif variables.project_id>
	</tbody>
</table>
	</cfif>
	<cfset variables.project_id=get_customer_monthly_progress.project_id>
<table class="table table-striped table-bordered table-condensed">
	<caption><h3>#project_name# <small>#project_code#</small></h3></caption>
	<thead>
		<tr>
			<th>Task</th>
			<th><abbr title="Anticipated Level of Effort">LOE</abbr></th>
			<th>Due</th>
			<th>Work Date</th>
			<th>Hours</th>
			<th>Work Performed</th>
		</tr>
	</thead>
	<tbody>
</cfif>
		<tr>
		<cfif variables.task_id NEQ get_customer_monthly_progress.task_id>
			<cfset variables.task_class="">
			<cfset variables.task_id=get_customer_monthly_progress.task_id>
		<cfelse>
			<cfset variables.task_class="hide-text">
		</cfif>
			<td><span class="#variables.task_class#"><h4>#task_name# <small>#task_id#</small></h4></span></td>
			<td class="number"><span class="#variables.task_class#">#budgeted_hours#</span></td>
			<td class="date"><span class="#variables.task_class#">#dateformat(due_date, 'm/d/yyyy')#</span></td>
			<td scope="row" class="date">#dateformat(work_date, 'm/d/yyyy')#</td>
			<td class="number">#decimalformat(hours)#</td>
			<td>#note#</td>
		</tr>
</cfoutput>
	</tbody>
</table>