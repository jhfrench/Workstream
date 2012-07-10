
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
			<cfinput type="Radio" name="project_planning_id" value="#project_planning_id#" id="p#project_planning_id#" checked="#variables.checked#" required="yes" message="Please choose a project timeline to view." onclick="document.project_timeline.submit();">
		</td>
		<td align="left">
			<label for="p#project_planning_id#">#project_planning_name#</label>
		</td>
	</tr>
</cfoutput>

