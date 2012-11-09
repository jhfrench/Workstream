<!-- Reports/qry_insert_pto_grant.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="insert_pto_grant" datasource="#application.datasources.main#">
INSERT INTO PTO_Grant (user_account_id, date_granted, granted_hours, comments)
VALUES (#user_account_id#, #createodbcdate(date_granted)#, #granted_hours#, '#comments#')
</cfquery>
</cfsilent>
