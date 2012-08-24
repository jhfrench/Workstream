
<!--common_files/qry_get_project_attachment_path.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I look-up all the known paths associated with the task's parent project.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<cfquery name="get_project_attachment_path" datasource="#application.datasources.main#">
SELECT Link_Project_Attachment_Path.file_path
FROM Link_Project_Attachment_Path
	INNER JOIN Task ON Link_Project_Attachment_Path.project_id=Task.project_id
		AND Task.task_id=#attributes.task_id#
WHERE Link_Project_Attachment_Path.active_ind=1
ORDER BY Link_Project_Attachment_Path.file_path
</cfquery>