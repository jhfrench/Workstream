
<!--common_files/dsp_task_list_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the column labels for the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfset variables.workstream_task_list_order=session.workstream_task_list_order>
</cfsilent>
<cfoutput>
<thead>
	<tr>
		<th>
			<a href="javascript:order_by('task_id');" title="Order by the task ID." class="SubHeadText"><abbr title="task id">ID</abbr><cfif NOT compare(ListFirst(ListFirst(variables.workstream_task_list_order), " "),"task_id")> <i class="icon-chevron-<cfif ListLen(ListFirst(variables.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th>
			<a href="javascript:order_by('task_owner');" title="Order by the task owner." class="SubHeadText">Owner<cfif NOT compare(ListFirst(ListFirst(variables.workstream_task_list_order), " "),"task_owner")> <i class="icon-chevron-<cfif ListLen(ListFirst(variables.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th>
			<a href="javascript:order_by('task_name');" title="Order by the name of the task." class="SubHeadText">Name<cfif NOT compare(ListFirst(ListFirst(variables.workstream_task_list_order), " "),"task_name")> <i class="icon-chevron-<cfif ListLen(ListFirst(variables.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th>
			<a href="javascript:order_by('project_name');" title="Order by the task engagement." class="SubHeadText">Project<cfif NOT compare(ListFirst(ListFirst(variables.workstream_task_list_order), " "),"project_name")> <i class="icon-chevron-<cfif ListLen(ListFirst(variables.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th class="SubHeadText" width="7%" nowrap>
			<a href="javascript:order_by('Priority');" title="Order by Priority." class="SubHeadText">Priority<cfif NOT compare(ListFirst(ListFirst(variables.workstream_task_list_order), " "),"Priority")> <i class="icon-chevron-<cfif ListLen(ListFirst(variables.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th>
			<a href="javascript:order_by('percent_time_used');" title="Order by the task time." class="SubHeadText">Time<cfif NOT compare(ListFirst(ListFirst(variables.workstream_task_list_order), " "),"percent_time_used")> <i class="icon-chevron-<cfif ListLen(ListFirst(variables.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th>
			<a href="javascript:order_by('task_status');" title="Order by the task status." class="SubHeadText">Status<cfif NOT compare(ListFirst(ListFirst(variables.workstream_task_list_order), " "),"task_status")> <i class="icon-chevron-<cfif ListLen(ListFirst(variables.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th>
			<a href="javascript:order_by('date_due');" title="Order by the date that the task is due." class="SubHeadText">Due<cfif NOT compare(ListFirst(ListFirst(variables.workstream_task_list_order), " "),"date_due")> <i class="icon-chevron-<cfif ListLen(ListFirst(variables.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
	</tr>
</thead>
</cfoutput>
