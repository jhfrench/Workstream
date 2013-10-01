
<!--common_files/qry_get_ref_company.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the companies that are visible to the current user.

	||
	Edits:
	$Log$
	 ||
	--> session.workstream_selected_company_id: this is the list of company id's that the user has selscted as their list of companies that they have access to view information for.
	<--company: this is the name company that is selected
	<--company_id: the ID number associated with the selected company.
	END FUSEDOC --->
<cfquery name="get_ref_company" datasource="#application.datasources.main#">
SELECT *
FROM REF_Company
WHERE active_ind=1<cfif isdefined("attributes.company_id")>
	AND company_id IN (<cfqueryparam value="#attributes.company_id#" cfsqltype="cf_sql_integer" list="yes" />)</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_company=get_ref_company>
</cfsilent>