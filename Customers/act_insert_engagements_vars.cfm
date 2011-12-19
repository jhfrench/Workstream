
<!--Customers/act_insert_engagements_vars.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get all the necessary information to insert a new engagement.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:45:30  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:40-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<!--- I get the root code and the billable id for the selected root --->
<cfquery name="get_root_code" datasource="#application.datasources.main#">
SELECT LEFT(root_code, 4) AS root_code, billable_id, company_id, description
FROM Customers
WHERE customers_id=#attributes.customers_id#
</cfquery>

<cfif isdefined("attributes.visible_to")>
	<cfset variables.visible_to=attributes.visible_to>
<cfelse>
	<!--- If no visible_to is define I retrieve the companies that the root is visible to and set that as the default list for the new engagement. --->
	<cfquery name="get_visible_to" datasource="#application.datasources.main#">
	SELECT visible_to AS visible
	FROM Customer_Visible_To
	WHERE code='#get_root_code.root_code#'
	</cfquery>
	<cfset variables.visible_to=valuelist(get_visible_to.visible)>
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

