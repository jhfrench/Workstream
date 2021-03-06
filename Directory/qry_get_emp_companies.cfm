
<!--Directory/qry_get_emp_companies.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	--> attributes.user_account_id: number containing the unique identifier of the individual being requested
	<-- company: string containing the name of any company the employee is associated with
 --->
<cfquery name="get_emp_companies" datasource="#application.datasources.main#">
SELECT REF_Company.description AS company
FROM REF_Company
	INNER JOIN Link_Company_User_Account ON REF_Company.company_id=Link_Company_User_Account.company_id
		AND Link_Company_User_Account.user_account_id=#attributes.user_account_id#
ORDER BY REF_Company.sort_order
</cfquery>
</cfsilent>
