
<!--Customers/qry_get_project_dashboard.cfm
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

<cfquery name="get_project_dashboard" datasource="#application.datasources.main#">
UPDATE Project
SET active_ind=#attributes.active_ind#,
	business_case='#attributes.business_case#',
	customer_id=#attributes.customer_id#,<cfif isdate("attributes.date_go_live")>
	date_go_live='#dateformat(attributes.date_go_live, "yyyy-mm-dd")#',</cfif>
	description='#attributes.description#',
	eng_status='#attributes.eng_status#',
	file_path='#attributes.file_path#',
	mission='#attributes.mission#',
	product_id=#attributes.product_id#,
	project_end='#dateformat(attributes.project_end, "yyyy-mm-dd")#',
	project_manager_id=#attributes.project_manager_id#,
	project_start='#dateformat(attributes.project_start, "yyyy-mm-dd")#',
	status=#attributes.status#
WHERE project_id=#attributes.project_id#
</cfquery>

<cfquery name="delete_old" datasource="#application.datasources.main#">
UPDATE Link_Project_Company
SET active_ind=0
WHERE active_ind=1
	AND project_id=#attributes.project_id#
	AND company_id NOT IN (#attributes.company_id#);

INSERT INTO Link_Project_Company (project_id, company_id, created_by)
SELECT #attributes.project_id#, company_id, #variables.user_identification#
FROM REF_Company
WHERE company_id IN (#attributes.company_id#)
	AND company_id NOT IN (
		SELECT company_id
		FROM Link_Project_Company
		WHERE active_ind=1
			AND project_id=#attributes.project_id#
	);
</cfquery>