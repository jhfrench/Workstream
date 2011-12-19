
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
	==> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
<cfoutput>
	<tr class="SubHeadText#session.workstream_text_size#">
		<td class="SubHeadText#session.workstream_text_size#">
			<a href="javascript:project_order('project_end');" onmouseover="MM_displayStatusMsg('ORDER BY the date that the engagement is due.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText#session.workstream_text_size#">Due <cfif NOT compare(ListFirst(ListFirst(session.workstream_engagement_list_order), " "),"project_end")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the date that the engagement is due." border="0"></cfif></a>
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			<a href="javascript:project_order('project_code');" onmouseover="MM_displayStatusMsg('ORDER BY the engagement code.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText#session.workstream_text_size#">Engagement Code <cfif NOT compare(ListFirst(ListFirst(session.workstream_engagement_list_order), " "),"project_code")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the engagement code." border="0"></cfif></a>
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			<a href="javascript:project_order('task_count');" onmouseover="MM_displayStatusMsg('ORDER BY the number of tasks.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText#session.workstream_text_size#">Tasks <cfif NOT compare(ListFirst(ListFirst(session.workstream_engagement_list_order), " "),"task_count")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the number of tasks." border="0"></cfif></a>
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			<a href="javascript:project_order('project_name');" onmouseover="MM_displayStatusMsg('ORDER BY the engagement name.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="SubHeadText#session.workstream_text_size#">Name <cfif NOT compare(ListFirst(ListFirst(session.workstream_engagement_list_order), " "),"project_name")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(session.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="ORDER BY the engagement name." border="0"></cfif></a>
		</td>
	</tr>
</cfoutput>
