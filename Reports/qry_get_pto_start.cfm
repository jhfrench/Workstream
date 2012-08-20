
<!-- Reports/qry_get_pto_start.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the datw that PTO started for a given company.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfquery name="get_pto_start" datasource="#application.datasources.main#">
SELECT pto_start_date
FROM REF_Company
WHERE company_id=#session.workstream_company_id#
</cfquery>
</cfsilent>
