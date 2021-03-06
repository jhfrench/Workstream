<!--Customers/act_increment_project_code.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the largest project_code from the project table for a given customer_id.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<!--I get the maximum client code in the root and add .001 to it-->
<cfquery name="get_root_base" datasource="#application.datasources.main#">
SELECT root_code
FROM Customer
WHERE customer_id=<cfqueryparam value="#attributes.customer_id#" cfsqltype="cf_sql_integer" />
</cfquery>
<cfset variables.root_base = get_root_base.root_code>
<cfif existing_projects.recordcount>
	<cfquery name="get_max_code" datasource="#application.datasources.main#">
	SELECT (CASE WHEN MAX(project_code)IS NULL THEN '#variables.root_base#' ELSE MAX(project_code) END) AS new_code
	FROM Project
	WHERE customer_id=<cfqueryparam value="#attributes.customer_id#" cfsqltype="cf_sql_integer" />
		AND project_code ~ '^[0-9]*(.[0-9]+)?$'
	</cfquery>
	<cfset variables.new_code=get_max_code.new_code+0.01>
<cfelseif attributes.strip_trailing_ind>
	<cfset variables.new_code=get_root_code.root_code>
<cfelse>
	<cfset variables.new_code=get_root_code.root_code+0.01>
</cfif>
</cfsilent>
