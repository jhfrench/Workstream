
<!--Timekeeping/dsp_project_timeline_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I initially display a list of Project Timelines that the user can view. If there is only one prject timeline then I automatically display that timeline.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfset variables.quote='"'>
<cfset variables.status_message_replace="',#variables.quote#">
<cfset variables.status_message_replace_with=",">
<cfset temp_grouper="">
</cfsilent>
<cfoutput query="get_project_timeline_details">
<cfif compare(selection_title, temp_grouper)>
	<cfset temp_grouper=selection_title>
	<tr>
		<td colspan="7"></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="6" class="SubHeadText">#selection_title#</td>
	</tr>
	<tr>
		<td class="RegTextBd"></td>
		<td class="RegTextBd"></td>
		<td class="RegTextBd"><u>Task</u></td>
		<td class="RegTextBd"><u>Resources</u></td>
		<td class="RegTextBd"><u>Start Date</u></td>
		<td class="RegTextBd"><u>End Date</u></td>
		<td class="RegTextBd"><u>Status</u></td>
	</tr>
</cfif>
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td bgcolor="##ffffff">&nbsp;</td>
		<td bgcolor="##ffffff">&nbsp;</td>
		<td><a href="javascript:list_to_details('#task_id#');"><img src="#request.dir_level##application.application_specific_settings.image_dir##task_icon#" alt="#ReplaceList(task_description, variables.quote, variables.status_message_replace_with)#" height="16" width="16" border="0">&nbsp;#task_name#</a></td>
	<cfinclude template="qry_get_team_members.cfm">
		<td>#listchangedelims(valuelist(get_team_members.name),", ")#</td>
		<td>#dateformat(assigned_date,"m/d/yyyy")#</td>
		<td>#dateformat(due_date,"m/d/yyyy")#</td>
		<td>#status#</td>
	</tr>
</cfoutput>

