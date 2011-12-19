
<!--Timekeeping/dsp_task_list_header.cfm
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
	Revision 1.2  2006/04/06 10:57:51  french
	Task 43345: Rearranged columns so that numbers wouldn't run up against each other. Also made display of hours data optional so that customer accounts won't automatically have access to our costs.

	Revision 1.1  2005-03-09 13:21:49-05  stetzer
	<>
	
	Revision 1.3  2003-01-09 10:43:12-05  blell
	added nowrap to <TD> so headers will no wrap
	
	Revision 1.2  2003-01-08 10:41:28-05  blell
	Added task's priority to task list.
	
	Revision 1.1  2001-10-11 10:55:05-04  long
	added $log $ for edits.  To all CFM files that have fusedocs.
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
<cfoutput>
	<tr class="SubHeadText#session.workstream_text_size#">
		<td class="SubHeadText#session.workstream_text_size#" nowrap>
			<a href="javascript:order_by('task_id');" onmouseover="MM_displayStatusMsg('ORDER BY the task ID.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText#session.workstream_text_size#">ID <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"task_id")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the task ID." border="0"></cfif></a>
		</td>
		<td class="SubHeadText#session.workstream_text_size#" nowrap>
			<a href="javascript:order_by('task_name');" onmouseover="MM_displayStatusMsg('ORDER BY the name of the task.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText#session.workstream_text_size#">Name <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"task_name")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the task name." border="0"></cfif></a>
		</td>
		<td class="SubHeadText#session.workstream_text_size#" nowrap>
			<a href="javascript:order_by('project_name');" onmouseover="MM_displayStatusMsg('ORDER BY the task engagement.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText#session.workstream_text_size#">Engagement<cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"project_name")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the date that the task is due." border="0"></cfif></a>
		</td>
		<td class="SubHeadText#session.workstream_text_size#" nowrap>
			<a href="javascript:order_by('task_owner');" onmouseover="MM_displayStatusMsg('ORDER BY the task owner.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText#session.workstream_text_size#">Owner <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"task_owner")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the task owner." border="0"></cfif></a>
		</td>
		<td class="SubHeadText#session.workstream_text_size#" nowrap>
			<a href="javascript:order_by('date_due');" onmouseover="MM_displayStatusMsg('ORDER BY the date that the task is due.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText#session.workstream_text_size#">Due <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"date_due")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the date that the task is due." border="0"></cfif></a>
		</td>
		<td class="SubHeadText#session.workstream_text_size#" nowrap>
			<a href="javascript:order_by('task_status');" onmouseover="MM_displayStatusMsg('ORDER BY the task status.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText#session.workstream_text_size#">Status <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"task_status")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the task status." border="0"></cfif></a>
		</td>
	<cfif listfind("1,5", session.workstream_emp_contact_type) OR session.workstream_show_hours_data_ind EQ 1><!--- show time data to employees or customers if their company is set up to view hours--->
		<td class="SubHeadText#session.workstream_text_size#" nowrap>
			<a href="javascript:order_by('percent_time_used');" onmouseover="MM_displayStatusMsg('ORDER BY the task time.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText#session.workstream_text_size#">Time <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"percent_time_used")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the amount of time spent on this task." border="0"></cfif></a>
		</td>
	</cfif>
		<td class="SubHeadText#session.workstream_text_size#" width="7%" nowrap>
			<a href="javascript:order_by('Priority');" onmouseover="MM_displayStatusMsg('ORDER BY Priority.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('Priority');" class="SubHeadText#session.workstream_text_size#">Priority <cfif NOT compare(ListFirst(ListFirst(session.workstream_task_list_order), " "),"Priority")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_task_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY priority of the task." border="0"></cfif></a>
		</td>
	</tr>
</cfoutput>
