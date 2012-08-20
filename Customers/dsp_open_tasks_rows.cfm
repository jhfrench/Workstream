
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
	--> application.application_specific_settings.image_dir: string that contains main path to the folder where all images are kept
	--> date_due: date when task is due
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
			<th>Due</th>
			<th>ID</th>
			<th>Time</th>
			<th>Owner</th>
			<th>Name</th>
			<th>Project</th>
			<th>Status</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_open_tasks">
		<tr>
			<td>#dateformat(date_due, "m/d/yyyy")#</td>
			<td>#task_id#</td>
			<td><a href="javascript:list_to_time('#task_id#');"><cfif listlen(time_used,".") GT 1>#decimalformat(time_used)#<cfelse>#numberformat(time_used)#</cfif><cfif time_budgeted>/#time_budgeted# #numberformat(percent_time_used)#%</cfif></a></td>
			<td>#task_owner#</td>
			<td><a href="javascript:list_to_task('#task_id#');"><img src="#request.dir_level##application.application_specific_settings.image_dir##task_icon#" alt="#ReplaceList(task_description, variables.quote, variables.status_message_replace_with)#" height="16" width="16" border="0">#task_name#</a></td>
			<td>#project_name#</td>
			<td><cfif NOT dateformat(now(), "m/d/yyyy") LT dateformat(date_due, "m/d/yyyy")><img src="#request.dir_level##application.application_specific_settings.image_dir#<cfif dateformat(now(), "m/d/yyyy") EQ dateformat(date_due, "m/d/yyyy")>not_started<cfelse>overdue</cfif>.gif" width="17" height="17" alt="" border="0">&nbsp;</cfif>#task_status#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
<cfelse>
<div class="alert alert-warning">
	You have no tasks that meet your criteria.
</div>
</cfif>
