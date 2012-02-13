
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
</cfsilent>
<cfoutput>
	<tr>
		<th class="SubHeadText" nowrap>
			<a href="javascript:order_by('task_id');" class="SubHeadText"><abbr title="task id">ID</abbr> <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"task_id")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the task ID." border="0"></cfif></a>
		</th>
		<th class="SubHeadText" nowrap>
			<a href="javascript:order_by('task_owner');" class="SubHeadText">Owner <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"task_owner")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the task owner." border="0"></cfif></a>
		</th>
		<th class="SubHeadText" nowrap>
			<a href="javascript:order_by('task_name');" class="SubHeadText">Name <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"task_name")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the task name." border="0"></cfif></a>
		</th>
		<th class="SubHeadText" nowrap>
			<a href="javascript:order_by('project_name');" class="SubHeadText">Project<cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"project_name")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the date that the task is due." border="0"></cfif></a>
		</th>
		<th class="SubHeadText" width="7%" nowrap>
			<a href="javascript:order_by('Priority');" class="SubHeadText">Priority <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"Priority")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY priority of the task." border="0"></cfif></a>
		</th>
	<cfif listfind("1,5", session.workstream_emp_contact_type) OR session.workstream_show_hours_data_ind EQ 1><!--- show time data to employees or customers if their company is set up to view hours--->
		<th class="SubHeadText" nowrap>
			<a href="javascript:order_by('percent_time_used');" class="SubHeadText">Time <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"percent_time_used")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the amount of time spent on this task." border="0"></cfif></a>
		</th>
	</cfif>
		<th class="SubHeadText" nowrap>
			<a href="javascript:order_by('task_status');"class="SubHeadText">Status <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"task_status")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the task status." border="0"></cfif></a>
		</th>
		<th class="SubHeadText" nowrap>
			<a href="javascript:order_by('date_due');" class="SubHeadText">Due <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"date_due")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the date that the task is due." border="0"></cfif></a>
		</th>
	</tr>
</cfoutput>
