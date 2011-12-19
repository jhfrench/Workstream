
<!--Customers/qry_get_engagements.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am used with the display engagements page, I select all the engagements for a root code.

	||
	Edits:
	$Log$
	Revision 1.3  2006/07/26 19:58:47  csy
	task 45384 -  I added  a line of constraint to avoid cartesian join.

	Revision 1.2  2006-03-31 10:39:13-05  csy
	task 42741 Modified code to include customer name to title

	Revision 1.1  2006-03-30 08:26:08-05  stetzer
	<>

	Revision 1.0  2005-02-15 15:46:08-05  daugherty
	Initial revision

	Revision 1.2  2002-04-09 09:52:58-04  french
	Added lookup for count of open tasks for each engagement returned by the query.

	Revision 1.1  2001-10-11 10:56:19-04  long
	added $log $ for edits.  To all CFM files that have fusedocs.
	||
	END FUSEDOC --->

	
<cfquery name="get_engagements" datasource="#application.datasources.main#">
SELECT Project.project_code, Project.description, Customers.description AS Cust_Description,
    Project.project_id, REF_Active_Indicator.active_ind_type, 
    ISNULL(REF_Billable.billable_type, 'Unknown') AS billable, ISNULL(COUNT(Task.task_id),0) AS open_tasks
FROM Project, Project_Visible_To, REF_Active_Indicator, REF_Billable, Task, Customers
WHERE Project.project_id=Project_Visible_To.project_id
	AND Project.active_id=REF_Active_Indicator.active_ind
	AND Project.billable_id*=REF_Billable.billable_id
	AND Project.Root_Code = Customers.Root_Code
	AND Task.project_id=*Project.project_id
	AND Task.status_id!=11
	ANd Customers.active_id!=0
	AND Project.active_id IN (<cfif compare(attributes.inactive, 0)>1,</cfif>2)
	AND Project_Visible_To.company_id IN (#session.workstream_company_select_list#)

	AND Project.project_code like '#attributes.client_code#%'
	

<!--- <cfif NOT Project_ID contains 'no'>
    AND Project.Project_ID like '#project_id#'
</cfif>	 --->
	AND LEN(Project.project_code) > 4
	AND RIGHT(Project.project_code, 3)!='000'
GROUP BY Project.project_code, Project.Description, 
    REF_Active_Indicator.Active_Ind_Type, Project.project_id, 
    REF_Billable.Billable_Type,Customers.description
ORDER BY <cfif NOT (isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2)>Project.description, </cfif>Project.project_code
</cfquery>
</cfsilent>
