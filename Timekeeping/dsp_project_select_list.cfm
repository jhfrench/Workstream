
<!--Timekeeping/dsp_project_select_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the attributes of a task. If a task is not specified I display the form to set task details/create a new task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.2  2006/03/31 08:05:49  french
	Changed display text to use SQL-calculated value instead of CF-calculated value.

	Revision 1.1  2005-03-09 13:21:27-05  stetzer
	<>

	Revision 1.0  2001-11-13 10:04:57-05  french
	Created file to remove from dsp_task_new_col_right.cfm.
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
<tr>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>" valign="top">
		Customer &amp; Engagement
		<cfoutput><img src="#request.dir_level##application.application_specific_settings.image_dir#popup_icon.gif" valign="bottom" width="14" height="12" alt="#alt#" border="0"  onclick="OpenProjectWindow('project_id');" tabindex="<cfset tabindex=incrementvalue(tabindex)>#incrementvalue(tabindex)#"></cfoutput><br>
		<cfset tabindex=incrementvalue(tabindex)>
		<cfselect name="project_id" size="5" tabindex="#tabindex#" required="yes" message="#msg#" class="RegText#session.workstream_text_size#">
			<cfoutput query="get_valid_projects">
				<option value="#project_id#"<cfif isdefined("attributes.project_id") AND NOT comparenocase(attributes.project_id, get_valid_projects.project_id)> selected</cfif>>#display#</option>
			</cfoutput>
		</cfselect>
	</td>
</tr>

