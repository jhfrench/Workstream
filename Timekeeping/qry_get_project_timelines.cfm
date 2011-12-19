
<!--Timekeeping/qry_get_project_timelines.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the name and the id of all the project timelines to which the user has been granted access.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 21:00:11  daugherty
	Initial revision

	Revision 1.1  2001-10-29 13:58:25-05  french
	Modified query.

	Revision 1.0  2001-10-29 13:10:20-05  french
	File creation.

	||
	END FUSEDOC --->
<cfquery name="get_project_timelines" datasource="#application.datasources.main#">
SELECT Project_Planning.project_planning_name, Project_Planning.project_planning_id
FROM Project_Planning, Project_Planning_Access
WHERE Project_Planning.project_planning_id=Project_Planning_Access.project_planning_id
	AND Project_Planning_Access.emp_id=#session.user_account_id#
</cfquery>
</cfsilent>

