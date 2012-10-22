
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
<cfset alt="">
<cfset msg="Please choose a project code.">
</cfsilent>
<div class="row-fluid">
	<div classs="span12">
		<label for="project_id">Customer &amp; Project <cfoutput> <i class="icon-share" title="See more projects." onclick="OpenProjectWindow('project_id');"></i></cfoutput></label>
		<cfselect name="project_id" id="project_id" size="5" required="yes" message="#msg#" class="span12">
			<cfoutput query="get_valid_projects">
				<option value="#project_id#"<cfif isdefined("attributes.project_id") AND NOT comparenocase(attributes.project_id, get_valid_projects.project_id)> selected="selected"</cfif>>#display#</option>
			</cfoutput>
		</cfselect>
	</div>
</div>