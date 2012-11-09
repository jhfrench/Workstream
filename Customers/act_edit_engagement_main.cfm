
<!--Reports/qry_get_engagement_dashboard.cfm
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

<cfquery name="get_engagement_dashboard" datasource="#application.datasources.main#">
UPDATE Project
SET active_ind=#attributes.active_ind#,
	business_case='#attributes.business_case#',
	customer_id=#attributes.customer_id#,
	<cfif isdate("attributes.date_go_live")>date_go_live='#dateformat(attributes.date_go_live,'yyyy-mm-dd')#',</cfif>
	description='#attributes.description#',
	eng_status='#attributes.eng_status#',
	file_path='#attributes.file_path#',
	mission='#attributes.mission#',
	product_id=#attributes.product_id#,
	project_end='#dateformat(attributes.project_end,'yyyy-mm-dd')#',
	project_manager_user_account_id=#attributes.project_manager_user_account_id#,
	project_start='#dateformat(attributes.project_start,'yyyy-mm-dd')#',
	status=#attributes.status#
WHERE project_id=#attributes.project_id#
</cfquery>

<cfquery name="delete_old" datasource="#application.datasources.main#">
DELETE FROM Link_Project_Company
WHERE project_id=#attributes.project_id#;

<cfloop list="#attributes.company_id#" index="ii">
INSERT INTO Link_Project_Company (project_id, company_id)
VALUES (#attributes.project_id#, #ii#);
</cfloop>
</cfquery>