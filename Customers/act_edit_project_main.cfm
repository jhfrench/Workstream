
<!--Customers/act_edit_project_main.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am not properly docummented by the file's author.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>

<cfquery name="update_project" datasource="#application.datasources.main#">
UPDATE Project
SET active_ind=<cfqueryparam value="#attributes.active_ind#" cfsqltype="cf_sql_integer">,
	business_case='#attributes.business_case#',
	customer_id=<cfqueryparam value="#attributes.customer_id#" cfsqltype="cf_sql_integer">,<cfif isdate("attributes.date_go_live")>
	date_go_live='#dateformat(attributes.date_go_live, "yyyy-mm-dd")#',</cfif>
	description='#attributes.description#',
	file_path='#attributes.file_path#',
	mission='#attributes.mission#',
	project_end='#dateformat(attributes.project_end, "yyyy-mm-dd")#'<cfif isdefined("attributes.project_manager_id")>,
	project_manager_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_manager_id#"></cfif>,
	project_start='#dateformat(attributes.project_start, "yyyy-mm-dd")#',
	date_updated=CURRENT_TIMESTAMP
WHERE project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">;

UPDATE Link_Project_Project_Status
SET active_ind=0
WHERE active_ind=1
	AND project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">;

INSERT INTO Link_Project_Project_Status(project_id, project_status_id, created_by)
VALUES(<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_status_id#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.user_identification#">);

UPDATE Link_Project_Project_Health
SET active_ind=0
WHERE active_ind=1
	AND project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">;

INSERT INTO Link_Project_Project_Health(project_id, project_health_id, created_by)
VALUES(<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_health_id#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.user_identification#">);

UPDATE Link_Project_Company
SET active_ind=0
WHERE active_ind=1
	AND project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">
	AND company_id NOT IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.company_id#" list="true">);

INSERT INTO Link_Project_Company (project_id, company_id, created_by)
SELECT <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">, company_id, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
FROM REF_Company
WHERE company_id IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.company_id#" list="true">)
	AND company_id NOT IN (
		SELECT company_id
		FROM Link_Project_Company
		WHERE active_ind=1
			AND project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">
	);

<cfif attributes.extend_billing_rate_start_ind>
UPDATE Billing_Rate
SET rate_start_date=<cfqueryparam cfsqltype="cf_sql_date" value="#attributes.project_start#">
FROM (
	SELECT Billing_Rate.user_account_id, MIN(Billing_Rate.rate_start_date) AS rate_start_date
	FROM Billing_Rate
	WHERE Billing_Rate.active_ind=1
		AND Billing_Rate.project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">
	GROUP BY Billing_Rate.user_account_id
) AS Active_Rate
WHERE Billing_Rate.project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">
	AND Billing_Rate.active_ind=1
	AND Billing_Rate.user_account_id=Active_Rate.user_account_id
	AND Billing_Rate.rate_start_date=Active_Rate.rate_start_date;
</cfif>

<cfif attributes.extend_billing_rate_end_ind>
UPDATE Billing_Rate
SET rate_end_date=<cfqueryparam cfsqltype="cf_sql_date" value="#attributes.project_end#">
FROM (
	SELECT Billing_Rate.user_account_id, MAX(Billing_Rate.rate_end_date) AS rate_end_date
	FROM Billing_Rate
	WHERE Billing_Rate.active_ind=1
		AND Billing_Rate.project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">
	GROUP BY Billing_Rate.user_account_id
) AS Active_Rate
WHERE Billing_Rate.project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#">
	AND Billing_Rate.active_ind=1
	AND Billing_Rate.user_account_id=Active_Rate.user_account_id
	AND Billing_Rate.rate_end_date=Active_Rate.rate_end_date;
</cfif>
</cfquery>