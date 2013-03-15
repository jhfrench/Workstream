
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
</cfsilent>

<cfform id="project_timeline" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="form-horizontal">
	<div class="control-group">
		<fieldset>
			<legend>Project Timelines</legend>
			<div class="controls">
			<cfoutput query="get_project_timelines">
				<label for="project_planning_id_#project_planning_id#" class="radio">
					<cfinput type="radio" name="project_planning_id" id="project_planning_id_#project_planning_id#" value="#project_planning_id#" required="yes" message="Please choose a project timeline to view." onclick="document.project_timeline.submit();"> #project_planning_name#
				</label>
			</cfoutput>
			</div>
		</fieldset>
	</div>
	<cfif get_project_timelines.recordcount>
	<div class="control-group">
		<div class="controls">
			<button type="submit" class="btn btn-primary">View details</button>
		</div>
	</div>
	</cfif>
</cfform>