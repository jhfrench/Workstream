
<!-- Customers/qry_get_prefix.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the code prefix for the new code being created.

	||
	Edits:
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="get_prefix" datasource="#application.datasources.main#">
SELECT code_prefix AS prefix
FROM REF_Company
WHERE company_id=#attributes.company_id#
</cfquery>
</cfsilent>
