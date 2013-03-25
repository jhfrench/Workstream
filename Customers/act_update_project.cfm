<!--- $issue$: does this really need close the tasks at the bottom? --->
<!--Customers/act_update_project.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I do the update to the project tables.

	||
	Edits:
	$Log$
	 ||
	-->project_id:  the id that indicates the project.
	END FUSEDOC --->

<cftransaction isolation="READ_COMMITTED">
<cfquery name="update_project" datasource="#application.datasources.main#">
UPDATE Project
SET description='#attributes.description#',
	project_code='#attributes.project_code#',
	budget=#attributes.budget#,
	billable_type_id=#attributes.billable_type_id#,
	active_ind=#attributes.active_ind#,
	company_id=#attributes.company_id#
WHERE project_id=#project_id#
</cfquery>

	<cfquery name="delete_flat_rate" datasource="#application.datasources.main#">
	UPDATE Flat_Rate
	SET active_ind=0
	WHERE active_ind=1
		AND project_id=#attributes.project_id#
	</cfquery>
	<cfif billable_type_id EQ 3>
		<cfquery name="insert_flat_rate" datasource="#application.datasources.main#">
		INSERT INTO Flat_Rate (rate_start_date, rate_end_date, project_id, budget, created_by)
		VALUES ('#attributes.start_date#', '#attributes.end_date#', #attributes.project_id#, #attributes.budget#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
		</cfquery>
	</cfif>

<cfquery name="update_link_project_company" datasource="#application.datasources.main#">
UPDATE Link_Project_Company
SET active_ind=0
WHERE active_ind=1
	AND project_id=#attributes.project_id#;
<cfloop list="#attributes.company_id#" index="ii">
INSERT INTO Link_Project_Company (project_id, company_id, created_by)
VALUES (#attributes.project_id#, #ii#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />);
</cfloop>
</cfquery>

<cfif isdefined("task_id")>
	<cfquery name="complete_tasks" datasource="#application.datasources.main#">
	UPDATE Task
	SET complete_date=CURRENT_TIMESTAMP,
		completed_by=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
	WHERE task_id IN (#task_id#);

	UPDATE Link_Task_Task_Status
	SET active_ind=0
	WHERE active_ind=1
		AND task_id IN (#task_id#);

	INSERT INTO Link_Task_Task_Status (task_id, task_status_id, created_by)
	SELECT task_id, 7 /*completed*/, #variables.user_identification#
	FROM Task
	WHERE task_id IN (#task_id#);
	</cfquery>
</cfif>
</cftransaction>