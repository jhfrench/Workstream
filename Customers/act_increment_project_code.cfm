
<!--Customers/act_increment_project_code.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the largest project_code from the project table for a given customer_id.

	||
	Edits:
	$Log$
	Revision 1.3  2006/07/26 20:03:50  csy
	task 45384 - I modified to allow not only project code incrementing but also project code naming conformity.

	Revision 1.2  2006-06-30 09:51:47-04  csy
	task 45384 I modified query so that 0 ( a numeric value) is returned when value IS NULL.

	
	Revision 1.0  2005-02-15 15:45:30-05  daugherty
	Initial revision

	Revision 1.2  2001-11-01 17:22:32-05  french
	Made changes to query so that the largest *numeric* project_code is returned.

	Revision 1.1  2001-10-11 10:56:40-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<!--I get the maximum client code in the root and add .001 to it-->
<cfquery name="get_root_base" datasource="#application.datasources.main#">
SELECT Root_Code
FROM Customers
WHERE customers_id=#attributes.customers_id#
</cfquery>
<cfset variables.root_base = get_root_base.Root_Code>
<cfif existing_engagements.recordcount>
<cfquery name="get_max_code" datasource="#application.datasources.main#">
SELECT (CASE WHEN MAX(project_code)IS NULL THEN '#variables.root_base#' ELSE MAX(project_code)end) AS new_code
FROM Project
WHERE customers_id=#attributes.customers_id#
	AND ISNUMERIC(project_code)=1
</cfquery>
	<cfset variables.new_code=get_max_code.new_code+0.001>
<cfelseif isdefined("attributes.strip_trailing")>
	<cfset variables.new_code=get_root_code.root_code>
<cfelse>
	<cfset variables.new_code=get_root_code.root_code+0.001>
</cfif>
</cfsilent>

