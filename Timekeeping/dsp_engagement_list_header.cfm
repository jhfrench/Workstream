
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
<cfset variables.workstream_engagement_list_order=session.workstream_engagement_list_order>
</cfsilent>
<cfoutput>
<thead>
	<tr>
		<th class="SubHeadText">
			<a href="javascript:project_order('project_end');"  title="Order by the date that the project is due." class="SubHeadText">Due <cfif NOT compare(ListFirst(ListFirst(variables.workstream_engagement_list_order), " "),"project_end")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(variables.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="Order by the date that the project is due." border="0"></cfif></a>
		</th>
		<th class="SubHeadText">
			<a href="javascript:project_order('project_code');"  title="Order by the project code." class="SubHeadText">Project Code <cfif NOT compare(ListFirst(ListFirst(variables.workstream_engagement_list_order), " "),"project_code")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(variables.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="Order by the project code." border="0"></cfif></a>
		</th>
		<th class="SubHeadText">
			<a href="javascript:project_order('task_count');"  title="Order by the number of tasks." class="SubHeadText">Tasks <cfif NOT compare(ListFirst(ListFirst(variables.workstream_engagement_list_order), " "),"task_count")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(variables.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="Order by the number of tasks." border="0"></cfif></a>
		</th>
		<th class="SubHeadText">
			<a href="javascript:project_order('project_name');"  title="Order by the project name." class="SubHeadText">Name <cfif NOT compare(ListFirst(ListFirst(variables.workstream_engagement_list_order), " "),"project_name")><img src="#request.dir_level##application.application_specific_settings.image_dir#order_<cfif ListLen(ListFirst(variables.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>.gif" width="8" height="8" alt="Order by the project name." border="0"></cfif></a>
		</th>
	</tr>
</thead>
</cfoutput>