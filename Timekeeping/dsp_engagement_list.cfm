
<!--Timekeeping/dsp_engagement_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream project list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.application_specific_settings.image_dir: string that contains main path to the folder where all images are kept
	--> project_code: numeric code of the project
	--> project_end: date or string containing targeted completion date for the project
	--> project_mission: string containing the desired outcome of the project
	--> project_name: name or description of the project
	--> task_count: number of tasks associated with the project that meets the user's specifications (ie on the team, not hidden, not completed)
 --->
<cfset variables.quote='"'>
<cfset variables.StatusMsg_replace="',#variables.quote#">
<cfset variables.StatusMsg_replace_with=",">
</cfsilent>
<table class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>
				<a href="javascript:project_order('project_end');"  title="Order by the date that the project is due.">Due <cfif NOT compare(listfirst(listfirst(variables.workstream_engagement_list_order), " "),"project_end")><i class="icon-chevron-<cfif listlen(listfirst(variables.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>"></i></cfif></a>
			</th>
			<th>
				<a href="javascript:project_order('project_code');"  title="Order by the project code.">Project Code <cfif NOT compare(listfirst(listfirst(variables.workstream_engagement_list_order), " "),"project_code")><i class="icon-chevron-<cfif listlen(listfirst(variables.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>"></i></cfif></a>
			</th>
			<th>
				<a href="javascript:project_order('task_count');"  title="Order by the number of tasks.">Tasks <cfif NOT compare(listfirst(listfirst(variables.workstream_engagement_list_order), " "),"task_count")><i class="icon-chevron-<cfif listlen(listfirst(variables.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>"></i></cfif></a>
			</th>
			<th>
				<a href="javascript:project_order('project_name');"  title="Order by the project name.">Name <cfif NOT compare(listfirst(listfirst(variables.workstream_engagement_list_order), " "),"project_name")><i class="icon-chevron-<cfif listlen(listfirst(variables.workstream_engagement_list_order), " ") EQ 2>down<cfelse>up</cfif>"></i></cfif></a>
			</th>
		</tr>
	</thead>
	<tbody>
	<cfif engagement_list.recordcount>
	<cfoutput query="engagement_list">
		<tr>
			<td class="date"><cfif isdate(project_end)>#dateformat(project_end, "m/d/yyyy")#<cfelse>None</cfif></td>
			<th scope="row">#project_code#</th>
			<td class="number"><a href="javascript:project_to_tasks('#project_id#');"  title="View task details for #ReplaceList(project_name, variables.StatusMsg_replace, variables.StatusMsg_replace_with)#.">#task_count#</a></td>
			<td><a href="javascript:project_to_tasks('#project_id#');"  title="View task details for #ReplaceList(project_name, variables.StatusMsg_replace, variables.StatusMsg_replace_with)#.">#project_name#</a></td>
		</tr>
	</cfoutput>
	<cfelse>
		<tr>
			<td align="center" colspan="4" class="Note">
				You have no projects that meet your criteria.
			</td>
		</tr>
	</cfif>
	</tbody>
</table>
<br />