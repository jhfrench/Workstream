
<!--Customers/act_edit_engagement_main.cfm
	Author: Jeromy French  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the list of details that a user can edit on an engagement.
	||
	Name: Jeromy F
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfparam name="attributes.ie_emp_id" default="0">
<cfset variables.file_path=URLDecode(File_Path)>
<cfquery name="edit_engagement_main" datasource="#application.datasources.main#">
UPDATE Project
SET Project.customers_id=#attributes.customers_id#,
	Project.description='#attributes.description#',
	Project.product_id=#attributes.product_id#,
	Project.project_end=#createodbcdatetime(attributes.project_end)#,
	Project.project_start=#createodbcdatetime(attributes.project_start)#,
	Project.mission='#attributes.mission#',
	Project.vision='#attributes.vision#',
	Project.business_case='#attributes.business_case#' ,
	Project.status=#attributes.status#,
	Project.ie_emp_id=#attributes.ie_emp_id#,
	Project.date_updated=GETDATE(),
	Project.active_ind=#attributes.active_id#,
	Project.eng_status=#attributes.eng_status#
<cfif len(attributes.date_go_live)>,Project.date_go_live=#createodbcdatetime(attributes.date_go_live)#</cfif>
<cfif len(variables.file_path)>,Project.file_path='#variables.file_path#'</cfif>
WHERE Project.project_id=#attributes.project_id#
</cfquery>
<cfif attributes.customers_id NEQ get_customer_name_code.customers_id>
	<cfquery name="update_project_code" datasource="#application.datasources.main#">
	/*re-initialize this project code so that it will not interfere with new project code assignment*/
	UPDATE Project
	SET Project.project_code=''
	WHERE Project.project_id=#attributes.project_id#
	</cfquery>
	<cfquery name="get_max_code" datasource="#application.datasources.main#">
	SELECT MAX(project_code) AS max_code
	FROM Project
	WHERE Project.customers_id=#attributes.customers_id#
	</cfquery>
	<cfset variables.max_code=get_max_code.max_code+(1/1000)>
	<cfset variables.add_zeroes=8-len(variables.max_code)>
	<cfquery name="update_project_code" datasource="#application.datasources.main#">
	UPDATE Project
	SET Project.project_code='#variables.max_code#<cfloop from="1" to="#variables.add_zeroes#" index="ii">0</cfloop>'
	WHERE Project.project_id=#attributes.project_id#
	</cfquery>
</cfif>
<cfquery name="update_visible_to" datasource="#application.datasources.main#">
DELETE Project_Visible_To
WHERE project_id=#attributes.project_id#
<cfloop list="#attributes.visible_to#" index="ii">
INSERT INTO Project_Visible_To (project_id, company_id)
VALUES (#attributes.project_id#, #ii#)
</cfloop>
</cfquery>
<cfif engagement_dashboard_return EQ 1>
	<cflocation url="../index.cfm?fuseaction=Reports.engagement_dashboard&customers_id_filter=#customers_id_filter#&ie_emp_id_filter=#ie_emp_id_filter#&sort=#sort#&###Project_ID#" addtoken="no">
</cfif>
</cfsilent>
