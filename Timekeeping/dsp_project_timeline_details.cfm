
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
<cfset variables.StatusMsg_replace="',#variables.quote#">
<cfset variables.StatusMsg_replace_with=",">
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
		<td colspan="6" class="SubHeadText#session.workstream_text_size#">#selection_title#</td>
	</tr>
	<tr>
		<td class="RegText#session.workstream_text_size#Bd"></td>
		<td class="RegText#session.workstream_text_size#Bd"></td>
		<td class="RegText#session.workstream_text_size#Bd"><u>Task</u></td>
		<td class="RegText#session.workstream_text_size#Bd"><u>Resources</u></td>
		<td class="RegText#session.workstream_text_size#Bd"><u>Start Date</u></td>
		<td class="RegText#session.workstream_text_size#Bd"><u>End Date</u></td>
		<td class="RegText#session.workstream_text_size#Bd"><u>Status</u></td>
	</tr>
</cfif>
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td class="RegText#session.workstream_text_size#" bgcolor="##ffffff">&nbsp;</td>
		<td class="RegText#session.workstream_text_size#" bgcolor="##ffffff">&nbsp;</td>
		<td class="RegText#session.workstream_text_size#"><a href="javascript:list_to_details('#task_id#');" class="RegText#session.workstream_text_size#"><img src="#request.dir_level##application.application_specific_settings.image_dir##task_icon#" alt="#ReplaceList(task_description, variables.quote, variables.StatusMsg_replace_with)#" height="16" width="16" border="0">&nbsp;#task_name#</a></td>
	<cfinclude template="qry_get_team_members.cfm">
		<td class="RegText#session.workstream_text_size#">#listchangedelims(valuelist(get_team_members.name),", ")#</td>
		<td class="RegText#session.workstream_text_size#">#DateFormat(assigned_date,"mm/dd/yy")#</td>
		<td class="RegText#session.workstream_text_size#">#DateFormat(due_date,"mm/dd/yy")#</td>
		<td class="RegText#session.workstream_text_size#">#status#</td>
	</tr>
</cfoutput>

