
<!--Timekeeping/dsp_select_project_timelines.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I initially display a list of Project Timelines that the user can view. If there is only one project timeline then I automatically submit to that timeline.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:21:31  stetzer
	<>

	Revision 1.2  2001-10-29 15:28:09-05  french
	Moved variable from 'pag_' level directly to this 'dsp_' where it is used.

	Revision 1.1  2001-10-29 13:27:56-05  french
	Removed line that was including this file from itself.

	Revision 1.0  2001-10-29 13:25:45-05  french
	File creation.

	||
 --->
<cfset variables.checked="no">
</cfsilent>
<cfoutput query="get_project_timelines">
	<cfif get_project_timelines.recordcount EQ 1>
		<cfset variables.onload="document.project_timeline.submit();">
		<cfset variables.checked="yes">
	</cfif>
	<tr>
		<td align="right">
			<cfinput type="Radio" name="project_planning_id" value="#project_planning_id#" id="p#project_planning_id#" checked="#variables.checked#" required="yes" message="Please choose a project timeline to view." onclick="document.project_timeline.submit();" class="RegText#session.workstream_text_size#">
		</td>
		<td align="left" class="RegText#session.workstream_text_size#">
			<label for="p#project_planning_id#">#project_planning_name#</label>
		</td>
	</tr>
</cfoutput>

