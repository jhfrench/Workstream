
<!--Customers/qry_get_project_main.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the main project details.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_project_main" datasource="#application.datasources.main#">
SELECT Project.customer_id, Project.description, Project.budget,
    Project.product_id, Project.billable_type_id, Project.mission,
    Project.vision, Project.business_case, Project.project_start, 
	Project.project_end, Project.status AS project_health_id, Project.project_manager_id,
	Project.active_ind, Project.file_path, Project.date_go_live,
	Project.LOE, Link_Project_Project_Status.project_status_id, Latest_Work.first_work_date,
	Latest_Work.last_work_date
FROM Project
	INNER JOIN Link_Project_Project_Status ON Project.project_id=Link_Project_Project_Status.project_id
		AND Link_Project_Project_Status.active_ind=1
	LEFT OUTER JOIN (
		SELECT Time_Entry.project_id, MIN(Time_Entry.work_date) AS first_work_date, MAX(Time_Entry.work_date) AS last_work_date
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">
		GROUP BY Time_Entry.project_id
	) Latest_Work ON Project.project_id=Latest_Work.project_id
WHERE Project.project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">
</cfquery>
</cfsilent>