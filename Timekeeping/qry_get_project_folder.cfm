
<!--Timekeeping/qry_get_project_folder.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the company for which the timeline applies.
	||
	Name: Jeromy French
	||
	Edits:
	||
	END FUSEDOC --->
<cfquery name="get_project_folder" datasource="#application.datasources.main#">
SELECT Customer.description AS company
FROM Customer, Project, Project_Planning
WHERE Customer.customer_id=Project.customer_id
	AND Project.project_id=Project_Planning.project_id
	AND Project_Planning.project_planning_id=1
</cfquery>
<cfset variables.company=get_project_folder.company>
</cfsilent>

