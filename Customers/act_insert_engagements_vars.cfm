
<!--Customers/act_insert_engagements_vars.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get all the necessary information to insert a new engagement.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<!--- I get the root code and the billable id for the selected root --->
<cfquery name="get_root_code" datasource="#application.datasources.main#">
SELECT LEFT(root_code, 4) AS root_code, billable_type_id, company_id, description
FROM Customer
WHERE customer_id=#attributes.customer_id#
</cfquery>

<cfif isdefined("attributes.company_id")>
	<cfset variables.company_id=attributes.company_id>
<cfelse>
	<!--- If no company_id is defined, I retrieve the companies that the root is visible to and set that as the default list for the new engagement. --->
	<cfquery name="get_company_id" datasource="#application.datasources.main#">
	SELECT company_id AS visible
	FROM Link_Customer_Company
	WHERE code='#get_root_code.root_code#'
	</cfquery>
	<cfset variables.company_id=valuelist(get_company_id.visible)>
</cfif>

<!--- I check to see if the root code has any existing engagements --->
<cfquery name="existing_engagements" datasource="#application.datasources.main#">
SELECT project_code
FROM Project
WHERE Project.root_code='#get_root_code.root_code#'
	AND LEN(project_code) > 4 
	AND RIGHT(project_code, 3) != '000'
</cfquery>

<!--I set clientname so that it includes the Root name as a prefix to the project name-->
<cfset variables.engagement_name="#get_root_code.description#-#attributes.description#">
</cfsilent>

