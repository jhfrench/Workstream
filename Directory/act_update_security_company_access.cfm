
<!-- Directory/act_update_security_company_access.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the company visible to table.

	||
	Edits:
	$Log$
	||
	Variables:

	END FUSEDOC --->
	<cfquery name="delete_security_company_access" datasource="#application.datasources.main#">
	UPDATE Security_Company_Access
	SET active_ind=0
	WHERE active_ind=1
		AND user_account_id=<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" />
	</cfquery>

	<cfinclude template="qry_insert_security_company_access.cfm">
</cfsilent>