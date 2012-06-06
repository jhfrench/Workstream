
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
<tbody>
<cfif engagement_list.recordcount>
<cfoutput query="engagement_list">
	<tr>
		<td><cfif isdate(project_end)>#dateformat(project_end, "mm/dd/yyyy")#<cfelse>None</cfif></td>
		<td>#project_code#</td>
		<td><a href="javascript:project_to_tasks('#project_id#');"  title="View task details for #ReplaceList(project_name, variables.StatusMsg_replace, variables.StatusMsg_replace_with)#.">#task_count#</a></td>
		<td><a href="javascript:project_to_tasks('#project_id#');"  title="View task details for #ReplaceList(project_name, variables.StatusMsg_replace, variables.StatusMsg_replace_with)#."><img src="#request.dir_level##application.application_specific_settings.image_dir#document.gif" alt="#project_mission#" height="16" width="16" border="0">#project_name#</a></td>
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