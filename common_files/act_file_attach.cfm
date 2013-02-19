
<!--common_files/act_file_attach.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I allow the user to associate a file path with a task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<cfset variables.full_file_path="#getdirectoryfrompath(gettemplatepath())#Uploaded_Files">
<!--- use cffile functions to upload then delete the file so we can store the path --->
<cftry>
	<cffile action="UPLOAD" destination="#variables.full_file_path#" filefield="FORM.MY_FILE" nameconflict="OVERWRITE">
	<cffile action="DELETE" file="#variables.full_file_path#/#cffile.serverfile#">
	<cfcatch>
		<div class="alert alert-info">
			This file is giving the server some trouble.
		<cftry>
			<cffile action="DELETE" file="#variables.full_file_path#/#cffile.clientfile#">
			<cfcatch>
			<p>(Couldn't delete it either)</p>
			</cfcatch>
		</cftry>
		</div>
	</cfcatch>
</cftry>
<cfset variables.file_path="#attributes.file_path##cffile.clientfile#">
<cfquery name="update_task_files" datasource="#application.datasources.main#">
INSERT INTO Link_Task_File (task_id, file_path, created_by)
VALUES (#attributes.task_id#, '#variables.file_path#', #variables.user_identification#)
</cfquery>

<cfoutput>
<div class="alert alert-success">
	<strong>That worked!</strong>
	"#variables.file_path#" is now associated with <a href="javascript:task_details(attributes.base_task_id);">task #attributes.base_task_id#</a>.
</div>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="task_details" field_name="task_id" fuseaction="Timekeeping.task_details">
</cfoutput>