
<!--Customers/act_insert_new_engagement.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I create a new engagement.

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:45:31  daugherty
	Initial revision

	Revision 1.2  2001-10-11 18:12:38-04  french
	Made changes to Flat_Rate insert so that the end_date is populated only if the user has specified it from the web page.
	
	Revision 1.1  2001-10-11 10:56:40-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	 
	(KL | 9/11/2001) Bug fix so that the "Flat-Rate" function works right.
	||
	END FUSEDOC --->
<cfquery name="insert_project" datasource="#application.datasources.main#">
INSERT INTO Project (root_code, customers_id, description,
	creator<cfif len(attributes.vision)>, vision</cfif><cfif len(attributes.mission)>, mission</cfif>
	<cfif len(attributes.business_case)>, business_case</cfif><cfif len(attributes.project_end)>, project_end</cfif><cfif len(attributes.project_start)>, project_start</cfif>,
	product_id, billable_id, project_code,
	active_id, company_id, budget)
VALUES ('#get_root_code.root_code#', #attributes.customers_id#, '#attributes.description#',
	#session.user_account_id#<cfif len(attributes.vision)>, '#attributes.vision#'</cfif><cfif len(attributes.mission)>, '#attributes.mission#'</cfif>
	<cfif len(attributes.business_case)>,' #attributes.business_case#'</cfif><cfif len(attributes.project_end)>, '#attributes.project_end#'</cfif><cfif len(attributes.project_start)>, '#attributes.project_start#'</cfif>, 
	#attributes.product_id#, #attributes.billable_id#, '#variables.new_code#',
	2, #get_root_code.company_id#, #attributes.budget#)
</cfquery>
<cfquery name="get_project_id" datasource="#application.datasources.main#">
SELECT MAX(project_id) AS project_id
FROM Project
</cfquery>
<cfquery name="get_project_code" datasource="#application.datasources.main#">
SELECT project_code
FROM Project
WHERE project_id=#get_project_id.project_id#
</cfquery>

<cfswitch expression="#attributes.billable_id#">
<!--- <cfcase value="1">
hourly
</cfcase> --->
<!--- <cfcase value="2">
non-billable
</cfcase> --->
<cfcase value="3">
	<!--- flat rate --->
	<cfquery name="flat_rate" datasource="#application.datasources.main#">
	INSERT INTO Flat_Rate (months, start_date<cfif len(attributes.end_date)>, end_date</cfif>, project_code, project_id, budget)
	VALUES(#attributes.months#, '#attributes.start_date#'<cfif len(attributes.end_date)>, '#attributes.end_date#'</cfif>, '#get_project_code.project_code#', #get_project_id.project_id#, #attributes.budget#)
	</cfquery>
</cfcase>
<cfcase value="4">
	<!--- per-incident --->
	<cfquery name="incident_rate" datasource="#application.datasources.main#">
	INSERT INTO Incident_Rate (project_id,charge)
	VALUES(#get_project_id.project_id#, #attributes.charge#)
	</cfquery>
</cfcase>
</cfswitch>

<cfquery name="delete_old" datasource="#application.datasources.main#">
DELETE Project_Visible_To
WHERE project_id=#get_project_id.project_id#
	AND company_id IN (#variables.visible_to#)
</cfquery>
<cfquery name="insert_visible" datasource="#application.datasources.main#">
INSERT INTO Project_Visible_To (project_id, company_id)
SELECT #get_project_id.project_id# AS project_id, company_id
FROM REF_Companies
WHERE company_id IN (#variables.visible_to#)
</cfquery>
