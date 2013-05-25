
<!--Customers/dsp_open_tasks_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> due_date: date when task is due
	--> task_id: unique number that identifies task entry
	--> task_name: name or title of the task
	--> task_owner: last name of the person ultimately responsible for succesful task resolution
	--> task_icon: icon specified for the task
	--> task_description: details or description of what is required to complete the task
	--> billing_code: code which task time will be invoiced to
	--> project_name: name of project which corresponds to the task
	--> task_status: current status of the task
	--> task_qa: last name of the person in charge of performing quality analysis on the tasks
	--> time_used: total amount of time recorded towards completion of the task
	--> time_budgeted: amount of time allocated or targeted to complete the task
	--> percent_time_used: number showing the amount of time used divided by the amount of time budgeted, shown only if time was budgeted
	--> task_status: string that indicates the task status
 --->
<cfset variables.quote='"'>
<cfset variables.status_message_replace_with="">
</cfsilent>
<cfif get_open_tasks.recordcount>
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Open Tasks for <cfoutput>#get_open_tasks.project_name#-#get_open_tasks.project_code#</cfoutput></h2></caption>
	<thead>
		<tr>
			<th>Task <abbr title="Identifier">ID</abbr></th>
			<th class="hidden-phone hidden-tablet">Owner</th>
			<th>Task</th>
			<th class="hidden-phone hidden-tablet">Project</th>
			<th class="hidden-phone">Priority</th>
			<th class="hidden-phone">Time</th>
			<th>Status</th>
			<th>Due</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_open_tasks">
		<tr>
			<td scope="row">#task_id#</td>
			<td class="hidden-phone hidden-tablet">#task_owner#</td>
			<td><a href="javascript:list_to_task('#task_id#');"><i class="#task_icon#" title="#replacelist(task_description, variables.quote, variables.status_message_replace_with)#"></i> #task_name#</a></td>
			<td class="hidden-phone hidden-tablet">#project_name#</td>
			<td class="hidden-phone">#priority#</td>
			<td class="hidden-phone"><a href="javascript:list_to_time('#task_id#');"><cfif listlen(time_used,".") GT 1>#decimalformat(time_used)#<cfelse>#numberformat(time_used)#</cfif><cfif time_budgeted>/#time_budgeted# #numberformat(percent_time_used)#%</cfif></a></td>
			<td>
				<cfset variables.days_left=datediff("d", now(), due_date)>
				<cfif variables.days_left EQ 0>
					<span class="badge badge-warning" title="Due today"><i class="icon-white icon-bell"></i></span>&nbsp;
				<cfelseif variables.days_left LT 0>
					<span class="badge badge-important" title="Overdue by #abs(variables.days_left)# days"><i class="icon-white icon-bullhorn"></i></span>&nbsp;
				</cfif>
				#task_status#
			</td>
			<td class="date">#dateformat(due_date, "m/d/yyyy")#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
<cfelse>
<div class="alert alert-warning">
	You have no tasks that meet your criteria.
</div>
</cfif>
