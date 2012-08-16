
<!--Customers/act_insert_new_engagement.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I create a new engagement.

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
	active_ind, company_id, budget,
	status)
VALUES ('#get_root_code.root_code#', #attributes.customer_id#, '#attributes.description#',
	#session.user_account_id#<cfif len(attributes.vision)>, '#attributes.vision#'</cfif><cfif len(attributes.mission)>, '#attributes.mission#'</cfif>
	<cfif len(attributes.business_case)>,' #attributes.business_case#'</cfif><cfif len(attributes.project_end)>, '#attributes.project_end#'</cfif><cfif len(attributes.project_start)>, '#attributes.project_start#'</cfif>, 
	#attributes.product_id#, #attributes.billable_type_id#, '#variables.new_code#',
	1, #get_root_code.company_id#, #attributes.budget#,
	1)
</cfquery>
<cfquery name="get_project_id" datasource="#application.datasources.main#">
SELECT CURRVAL('Project_project_id_SEQ') AS project_id
</cfquery>

<cfswitch expression="#attributes.billable_type_id#">
<cfcase value="1">
	<!--- hourly --->
	<cfquery name="insert_billing_rate" datasource="#application.datasources.main#">
	INSERT INTO Billing_Rate (project_id, rate, rate_start_date<cfif len(attributes.end_date)>, rate_end_date</cfif>, emp_id)
	SELECT #get_project_id.project_id#, '#attributes.rate#', '#attributes.start_date#'<cfif len(attributes.end_date)>, '#attributes.end_date#'</cfif>, emp_id
	FROM Link_Company_Emp_Contact
	WHERE company_id IN (#attributes.company_id#)
	</cfquery>
</cfcase>
<!--- <cfcase value="2">
non-billable
</cfcase> --->
<cfcase value="3">
	<!--- flat rate --->
	<cfquery name="insert_flat_rate" datasource="#application.datasources.main#">
	INSERT INTO Flat_Rate (rate_start_date<cfif len(attributes.end_date)>, rate_end_date</cfif>, project_id, budget)
	VALUES('#attributes.start_date#'<cfif len(attributes.end_date)>, '#attributes.end_date#'</cfif>, #get_project_id.project_id#, #attributes.budget#)
	</cfquery>
</cfcase>
<cfcase value="4">
	<!--- per-incident --->
	<cfquery name="incident_rate" datasource="#application.datasources.main#">
	INSERT INTO Incident_Rate (project_id, charge)
	VALUES(#get_project_id.project_id#, #attributes.charge#)
	</cfquery>
</cfcase>
</cfswitch>

<cfquery name="delete_old" datasource="#application.datasources.main#">
DELETE FROM Link_Project_Company
WHERE project_id=#get_project_id.project_id#
	AND company_id IN (#variables.company_id#)
</cfquery>
<cfquery name="insert_visible" datasource="#application.datasources.main#">
INSERT INTO Link_Project_Company (project_id, company_id)
SELECT #get_project_id.project_id# AS project_id, company_id
FROM REF_Company
WHERE company_id IN (#variables.company_id#)
</cfquery>
