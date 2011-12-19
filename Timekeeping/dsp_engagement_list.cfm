
<!--Timekeeping/dsp_engagement_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream project/engagement list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:20:48  stetzer
<>

Revision 1.1  2001-10-11 10:55:13-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.application_specific_settings.image_dir: string that contains main path to the folder where all images are kept
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	--> project_code: numeric code of the project/engagement
	--> project_end: date or string containing targeted completion date for the project/engagement
	--> project_mission: string containing the desired outcome of the project/engagement
	--> project_name: name or description of the project/engagement
	--> task_count: number of tasks associated with the project/engagement that meets the user's specifications (ie on the team, not hidden, not completed)
 --->
<cfset variables.quote='"'>
<cfset variables.StatusMsg_replace="',#variables.quote#">
<cfset variables.StatusMsg_replace_with=",">
</cfsilent>
<cfif engagement_list.recordcount>
<cfoutput query="engagement_list">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td class="RegText#session.workstream_text_size#"><cfif NOT compare(project_end,"")>#dateformat(project_end, "mm/dd/yyyy")#<cfelse>None</cfif></td>
		<td class="RegText#session.workstream_text_size#">#project_code#</td>
		<td class="RegText#session.workstream_text_size#"><a href="javascript:project_to_tasks('#project_id#');" onmouseover="MM_displayStatusMsg('View task details for #ReplaceList(project_name, variables.StatusMsg_replace, variables.StatusMsg_replace_with)#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#task_count#</a></td>
		<td class="RegText#session.workstream_text_size#"><a href="javascript:project_to_tasks('#project_id#');" onmouseover="MM_displayStatusMsg('View task details for #ReplaceList(project_name, variables.StatusMsg_replace, variables.StatusMsg_replace_with)#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#"><img src="#request.dir_level##application.application_specific_settings.image_dir#document.gif" alt="#project_mission#" height="16" width="16" border="0">#project_name#</a></td>
	</tr>
</cfoutput>
<cfelse>
	<tr>
		<td align="center" colspan="4" class="Note<cfoutput>#session.workstream_text_size#</cfoutput>">
			You have no engagements that meet your criteria.
		</td>
	</tr>
</cfif>