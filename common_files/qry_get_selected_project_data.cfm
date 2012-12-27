
<!--common_files/qry_get_selected_project_data.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve all projects that a user can see. The project must be active and visible to the company for which the user works.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->
<cfquery name="get_selected_project_data" datasource="#application.datasources.main#">
SELECT Project.*
FROM Project
	INNER JOIN Task ON Project.project_id=Task.project_id
		AND Task.task_id=#attributes.task_id#
</cfquery>
</cfsilent>