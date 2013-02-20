
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
	 || 
 --->
</cfsilent>
<cfparam name="attributes.project_id" default="0">
<div class="row-fluid">
	<div classs="span12">
		<label for="project_id">Customer &amp; Project <i class="icon-share" title="See more projects." onclick="OpenProjectWindow('project_id');"></i></label>
		<cfselect name="project_id" id="project_id" size="5" required="yes" message="Please choose a project code." class="span12">
			<cfoutput query="get_valid_projects">
				<option value="#project_id#"<cfif attributes.project_id EQ get_valid_projects.project_id> selected="selected"</cfif>>#display#</option>
			</cfoutput>
		</cfselect>
	</div>
</div>