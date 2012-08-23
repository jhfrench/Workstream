
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
	</cfcatch>
		</div>
</cftry>
<cfset variables.file_path="#attributes.file_path##cffile.clientfile#">
<cfquery name="update_task_files" datasource="#application.datasources.main#">
INSERT INTO Link_Task_File (task_id, file_path, created_by)
VALUES (#attributes.task_id#, '#variables.file_path#', #session.user_account_id#)
</cfquery>

<cfoutput>
<div class="alert alert-success">
"#variables.file_path#" is now associated with task #attributes.task_id#.
</div>
</cfoutput>