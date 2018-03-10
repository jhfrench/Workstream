
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
	--> due_date: date when task is due
	--> task_id: unique number that identifies task entry
	--> task_name: name or title of the task
	--> task_owner: last name of the person ultimately responsible for succesful task resolution
	--> task_icon: icon specified for the task
	--> task_description: details or description of what is required to complete the task
	--> billing_code: code which task time will be invoiced to
	--> project_name: name of project which corresponds to the task
	--> task_status: current status of the task
	--> used_hours: total amount of time recorded towards completion of the task
	--> budgeted_hours: amount of time allocated or targeted to complete the task
	--> percent_used_hours: number showing the amount of time used divided by the amount of time budgeted, shown only if time was budgeted
	--> task_status: string that indicates the task status
 --->
</cfsilent>
<cfif get_task_list.recordcount>
<tbody>
<cfoutput query="get_task_list">
	<cfset variables.status_message=jsstringformat(task_name)>
	<tr>
		<td scope="row">#task_id#</td>
		<td class="hidden-phone hidden-tablet"><abbr title="#task_owner_full_name#">#task_owner#</abbr></td>
		<td><a href="index.cfm?fuseaction=Timekeeping.task_details&task_id=#task_id#" title="View time details for #variables.status_message#."><i class="#task_icon# hidden-phone" title="#replacelist(left(task_description, 150), '"', '&quot;')#..."></i>#task_name#</a></td>
		<td class="hidden-phone hidden-tablet">#project_name#</td>
		<td class="hidden-phone" data-sort="#priority_sort#">#priority#</td>
		<td class="hidden-phone"><a href="index.cfm?fuseaction=Timekeeping.time_details&task_id=#task_id#" title="View time details for #variables.status_message#."><cfif listlen(used_hours) GT 1 AND listgetat(used_hours,2,".") GT 0>#decimalformat(used_hours)#<cfelse>#numberformat(used_hours)#</cfif><cfif budgeted_hours>/#budgeted_hours# #numberformat((used_hours/budgeted_hours)*100)#%</cfif></a></td>
		<td>
			<cfif NOT listfind("7,8", task_status_id)>
				<cfset variables.days_left=datediff("d", now(), due_date)>
				<cfif variables.days_left EQ 0>
					<span class="badge badge-warning" title="Due today"><i class="icon-white icon-bell"></i></span>&nbsp;
				<cfelseif variables.days_left LT 0>
					<span class="badge badge-important" title="Overdue by #abs(variables.days_left)# days"><i class="icon-white icon-bullhorn"></i></span>&nbsp;
				</cfif>
			</cfif>#task_status#
		</td>
		<td class="date" data-sort="#dateformat(due_date, "yyyymmdd")#">#dateformat(due_date, "mm/dd/yyyy")#</td>
	</tr>
</cfoutput>
</tbody>
</cfif>
