
<!--Reports/qry_get_pto_names.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I run the queries that show PTO-elligible employees in the drop-down selection.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfquery name="get_pto_names" datasource="#application.datasources.main#">
SELECT Demographics.last_name, Demographics.first_name, Demographics.user_account_id
FROM Demographics
	INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
		AND Link_Company_User_Account.active_ind=1
	INNER JOIN User_Account ON Demographics.user_account_id=Demographics.user_account_id
		AND User_Account.account_type_id=1
WHERE Demographics.active_ind=1
	AND Link_Company_User_Account.company_id=<cfqueryparam value="#session.workstream_company_id#" cfsqltype="cf_sql_integer" />
	AND (Demographics.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" /><cfif get_subordinates.recordcount>
		OR Demographics.user_account_id IN (<cfqueryparam value="#valuelist(get_subordinates.user_account_id)#,#variables.user_identification#" cfsqltype="cf_sql_integer" list="true" />)</cfif>)
GROUP BY Demographics.last_name, Demographics.first_name, Demographics.user_account_id
ORDER BY Demographics.last_name, Demographics.first_name
</cfquery>
</cfsilent>