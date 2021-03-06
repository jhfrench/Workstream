
<!--Admin/qry_update_Security_Company_Access.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the modeul_access field of the User_Profile table.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<cfquery name="update_Security_Company_Access" datasource="#application.datasources.main#">
/*wipe out old access*/
DELETE FROM Security_Company_Access
WHERE user_account_id=#attributes.user_account_id#;

/*insert new access*/
INSERT INTO Security_Company_Access (user_account_id, company_id)
SELECT #attributes.user_account_id# AS user_account_id, company_id
FROM REF_Company
WHERE company_id IN (#attributes.company_id#);
</cfquery>
</cfsilent>