
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
</cfsilent>
<table class="table table-striped table-bordered">
	<caption>#get_project_timeline_details.project_planning_name#</caption>
	<thead>
		<tr>
			<th>Task</th>
			<th>Resources</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Status</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_project_timeline_details">
		<tr>
			<td>#selection_title#</td>
			<td><a href="javascript:list_to_details('#task_id#');"><i class="#task_icon#" title="#replacelist(left(task_description, 150), '"', '')#..."></i>&nbsp;#task_name#</a></td>
			<cfinclude template="qry_get_team_members.cfm">
			<td>#listchangedelims(valuelist(get_team_members.last_name),", ")#</td>
			<td>#dateformat(assigned_date,"mm/dd/yyyy")#</td>
			<td>#dateformat(due_date,"mm/dd/yyyy")#</td>
			<td>#status#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>