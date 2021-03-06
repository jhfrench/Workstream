
<!--Customers/act_insert_new_project.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I create a new project.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>
<cfquery name="insert_project" datasource="#application.datasources.main#">
INSERT INTO Project (root_code, customer_id, description,
	created_by<cfif len(attributes.vision)>, vision</cfif><cfif len(attributes.mission)>, mission</cfif>
	<cfif len(attributes.business_case)>, business_case</cfif><cfif len(attributes.project_end)>, project_end</cfif><cfif len(attributes.project_start)>, project_start</cfif>,
	product_id, billable_type_id, project_code,
	active_ind, company_id, budget)
VALUES ('#get_root_code.root_code#', <cfqueryparam value="#attributes.customer_id#" cfsqltype="cf_sql_integer" />, '#attributes.description#',
	<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" /><cfif len(attributes.vision)>, '#attributes.vision#'</cfif><cfif len(attributes.mission)>, '#attributes.mission#'</cfif>
	<cfif len(attributes.business_case)>,' #attributes.business_case#'</cfif><cfif len(attributes.project_end)>, '#attributes.project_end#'</cfif><cfif len(attributes.project_start)>, '#attributes.project_start#'</cfif>,
	<cfqueryparam value="#attributes.product_id#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#attributes.billable_type_id#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#variables.new_code#" cfsqltype="cf_sql_integer" />,
	1, <cfqueryparam value="#session.workstream_company_id#" cfsqltype="cf_sql_integer" />, #attributes.budget#)
RETURNING project_id;
</cfquery>
<cfset attributes.project_id=insert_project.project_id>

<cfswitch expression="#attributes.billable_type_id#">
<cfcase value="1">
	<!--- hourly --->
	<!--- $issue$: need to adjust invoice procedure and all other queries to allow for NULL rate_end_date --->
	<cfquery name="insert_billing_rate" datasource="#application.datasources.main#">
	INSERT INTO Billing_Rate (project_id, user_account_id, rate,
		rate_start_date<cfif len(attributes.end_date)>, rate_end_date</cfif>, created_by)
	SELECT <cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" />, Link_Company_User_Account.user_account_id, '#attributes.rate#',
		'#attributes.start_date#'<cfif len(attributes.end_date)>, '#attributes.end_date#'</cfif>, #variables.user_identification#
	FROM Link_Company_User_Account
	WHERE active_ind=1
		AND company_id IN (<cfqueryparam value="#attributes.company_id#" cfsqltype="cf_sql_integer" list="true" />)
	</cfquery>
</cfcase>
<!--- <cfcase value="2">
non-billable
</cfcase> --->
<cfcase value="3">
	<!--- flat rate --->
	<cfquery name="insert_flat_rate" datasource="#application.datasources.main#">
	INSERT INTO Flat_Rate (project_id, budget, rate_start_date,
		<cfif len(attributes.end_date)>rate_end_date, </cfif>created_by)
	VALUES(<cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" />, #attributes.budget#, '#attributes.start_date#',
		<cfif len(attributes.end_date)>'#attributes.end_date#', </cfif><cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
	</cfquery>
</cfcase>
<cfcase value="4">
	<!--- per-incident --->
	<cfquery name="incident_rate" datasource="#application.datasources.main#">
	INSERT INTO Incident_Rate (project_id, charge, created_by)
	VALUES(<cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" />, #attributes.charge#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
	</cfquery>
</cfcase>
</cfswitch>

<cfquery name="delete_old" datasource="#application.datasources.main#">
INSERT INTO LINK_Project_Project_Status(project_id, project_status_id, created_by)
VALUES(<cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" />, 1, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />);

INSERT INTO LINK_Project_Project_Health(project_id, project_health_id, created_by)
VALUES(<cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" />, 1, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />);

INSERT INTO Link_Project_Company (project_id, company_id, created_by)
SELECT <cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" /> AS project_id, company_id, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
FROM REF_Company
WHERE company_id IN (<cfqueryparam value="#variables.company_id#" cfsqltype="cf_sql_integer" list="true" />)
</cfquery>
