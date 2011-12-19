
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
SELECT Customers.description AS company
FROM Customers, Project, Project_Planning
WHERE Customers.customers_id=Project.customers_id
	AND Project.project_id=Project_Planning.project_id
	AND Project_Planning.project_planning_id=1
</cfquery>
<cfset variables.company=get_project_folder.company>
</cfsilent>

