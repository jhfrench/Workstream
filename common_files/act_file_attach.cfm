
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
<cfset variables.full_file_path="#GetDirectoryfromPath(GettemplatePath())#Uploaded_Files">
<!--- use cffile functions to upload then delete the file so we can store the path --->
<cffile action="UPLOAD" destination="#variables.full_file_path#" filefield="form.my_file" nameconflict="OVERWRITE">
<cffile action="DELETE" file="#variables.full_file_path#\#cffile.serverfile#">
<cfif comparenocase(cffile.clientdirectory,cffile.clientfile)>
	<cfset variables.file_path="#cffile.clientdirectory#\#cffile.clientfile#">
<cfelse>
	<cfif attributes.task_id NEQ 0>
		<cfquery name="get_attached_file_path" datasource="#application.datasources.main#">
		SELECT Project.attached_file_path
		FROM Project
			INNER JOIN Task ON Project.project_id=Task.project_id
		WHERE Task.task_id=#attributes.task_id#
		</cfquery>
		<cfset variables.file_path="#get_attached_file_path.attached_file_path#\#cffile.clientfile#">
	<cfelse>
		<cfset variables.file_path=cffile.clientfile>
	</cfif>
</cfif>
<cfquery name="update_task_files" datasource="#application.datasources.main#">
INSERT INTO Associated_File (task_id,file_path, created_by)
VALUES (#attributes.task_id#,'#variables.file_path#', #session.user_account_id#)
</cfquery>

<cfoutput>
"#variables.file_path#" is now associated with task #attributes.task_id#.
</cfoutput>