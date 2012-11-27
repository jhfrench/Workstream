
<!--common_files/dsp_task_list.cfm
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
	--> used_hours: total amount of time recorded towards completion of the task
	--> budgeted_hours: amount of time allocated or targeted to complete the task
	--> percent_used_hours: number showing the amount of time used divided by the amount of time budgeted, shown only if time was budgeted
	--> task_status: string that indicates the task status
 --->
<cfset variables.quote='"'>
<cfset variables.status_message_replace="',#variables.quote#">
<cfset variables.status_message_replace_with=",">
</cfsilent>
<cfif get_task_list.recordcount>
<tbody>
<cfoutput query="get_task_list"> 
	<cfset variables.status_message=jsstringformat(task_name)>
	<tr>
		<td scope="row" class="number">#task_id#</td>
		<td class="hidden-phone"><abbr title="#task_owner_full_name#">#task_owner#</abbr></td>
		<td><a href="javascript:list_to_task('#task_id#');" title="View time details for #variables.status_message#."><i class="#task_icon#" title="#replacelist(task_description, variables.quote, variables.status_message_replace_with)#"></i>#task_name#</a></td>
		<td class="hidden-phone">#project_name#</td>
		<td class="hidden-phone">#priority#</td>
		<td class="hidden-phone"><a href="javascript:list_to_time('#task_id#');" title="View time details for #variables.status_message#."><cfif listlen(used_hours) GT 1 AND listgetat(used_hours,2,".") GT 0>#decimalformat(used_hours)#<cfelse>#numberformat(used_hours)#</cfif><cfif budgeted_hours>/#budgeted_hours# #numberformat((used_hours/budgeted_hours)*100)#%</cfif></a></td>
		<td><cfif status_id NEQ 7 AND datecompare(now(), due_date, "d") GTE 0><i class="status_<cfif datecompare(now(), due_date, "d") EQ 0>not_started<cfelse>overdue</cfif>"></i>&nbsp;</cfif>#task_status#</td>
		<td class="date">#dateformat(due_date, "m/d/yyyy")#</td>
	</tr>
</cfoutput>
</tbody>
</cfif>