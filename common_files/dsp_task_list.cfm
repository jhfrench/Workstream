
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
	--> time_used: total amount of time recorded towards completion of the task
	--> time_budgeted: amount of time allocated or targeted to complete the task
	--> percent_time_used: number showing the amount of time used divided by the amount of time budgeted, shown only if time was budgeted
	--> task_status: string that indicates the task status
 --->
<cfset variables.quote='"'>
<cfset variables.status_message_replace="',#variables.quote#">
<cfset variables.status_message_replace_with=",">
<cfparam name="attributes.user_account_id" default="#variables.user_identification#">
</cfsilent>
<cfif task_list.recordcount>
<tbody>
<cfoutput query="task_list"> 
	<cfset variables.status_message=jsstringformat(task_name)>
	<tr>
		<td scope="row" class="number">#task_id#</td>
		<td><abbr title="#task_owner_full#">#task_owner#</abbr></td>
		<td><a href="javascript:list_to_task('#task_id#');" title="View time details for #variables.status_message#."><i class="#task_icon#" title="#ReplaceList(task_description, variables.quote, variables.status_message_replace_with)#"></i>#task_name#</a></td>
		<td>#project_name#</td>
		<td>#priority#</td>
		<td><a href="javascript:list_to_time('#task_id#');" title="View time details for #variables.status_message#."><cfif listlen(time_used) GT 1 AND listgetat(time_used,2,".") GT 0>#decimalformat(time_used)#<cfelse>#numberformat(time_used)#</cfif><cfif time_budgeted>/#time_budgeted# #numberformat(percent_time_used)#%</cfif></a></td>
		<td><cfif status_id NEQ 7 AND datecompare(now(), due_date, "d") GTE 0><i class="status_<cfif datecompare(now(), due_date, "d") EQ 0>not_started<cfelse>overdue</cfif>"></i>&nbsp;</cfif>#task_status#</td>
		<td class="date">#dateformat(due_date, "m/d/yyyy")#</td>
	</tr>
</cfoutput>
</tbody>
</cfif>