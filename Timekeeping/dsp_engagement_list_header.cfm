
<!--Timekeeping/dsp_engagement_list_header.cfm
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
	<tr class="SubHeadText">
		<td class="SubHeadText">
			<a href="javascript:project_order('project_end');" onmouseover="MM_displayStatusMsg('ORDER BY the date that the project is due.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText">Due <cfif NOT compare(ListFirst(ListFirst(session.workstream_engagement_list_order), " "),"project_end")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the date that the project is due." border="0"></cfif></a>
		</td>
		<td class="SubHeadText">
			<a href="javascript:project_order('project_code');" onmouseover="MM_displayStatusMsg('ORDER BY the project code.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText">Project Code <cfif NOT compare(ListFirst(ListFirst(session.workstream_engagement_list_order), " "),"project_code")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the project code." border="0"></cfif></a>
		</td>
		<td class="SubHeadText">
			<a href="javascript:project_order('task_count');" onmouseover="MM_displayStatusMsg('ORDER BY the number of tasks.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText">Tasks <cfif NOT compare(ListFirst(ListFirst(session.workstream_engagement_list_order), " "),"task_count")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the number of tasks." border="0"></cfif></a>
		</td>
		<td class="SubHeadText">
			<a href="javascript:project_order('project_name');" onmouseover="MM_displayStatusMsg('Order by the project name.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText">Name <cfif NOT compare(ListFirst(ListFirst(session.workstream_engagement_list_order), " "),"project_name")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the project name." border="0"></cfif></a>
		</td>
	</tr>
</cfoutput>
