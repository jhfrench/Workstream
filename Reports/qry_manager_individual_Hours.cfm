
<!--Reports/qry_manager_individual_Hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<!--- $issue$: change this query name --->
<cfquery name="name" datasource="#application.datasources.main#"> 
SELECT REF_Company.description AS company, Demographics.first_name, 
    Demographics.last_name, Demographics.user_account_id
FROM Link_Company_User_Account
	INNER JOIN Demographics ON Link_Company_User_Account.user_account_id=Demographics.user_account_id
	INNER JOIN REF_Company ON Link_Company_User_Account.company_id = REF_Company.company_id
	INNER JOIN Link_User_Account_Status ON Link_User_Account_Status.user_account_id=Demographics.user_account_id
		AND Link_User_Account_Status.active_ind=1
		AND Link_User_Account_Status.account_status_id=1 /*active*/
WHERE Demographics.user_account_id=#attributes.user_account_id#
ORDER BY last_name, name
</cfquery>
