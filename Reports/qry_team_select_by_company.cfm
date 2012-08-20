
<!-- Reports/qry_team_select_by_company.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the active people that work for the companys that you are allowed to see.

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="get_team_select_by_company" datasource="#application.datasources.main#">
SELECT Emp_Contact.emp_id, Emp_Contact.lname, Emp_Contact.name,
	 Link_Company_Emp_Contact.company_id, COALESCE(REF_Company.description,'NA') AS company_name
FROM Emp_Contact
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
	LEFT OUTER JOIN REF_Company ON Link_Company_Emp_Contact.company_id=REF_Company.company_id
	INNER JOIN Link_User_Account_Status ON Link_User_Account_Status.user_account_id=Emp_Contact.emp_id
		AND Link_User_Account_Status.active_ind=1
		AND Link_User_Account_Status.account_status_id=1 /*active*/
WHERE Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
	AND #application.team_changed#=#application.team_changed#
ORDER BY Link_Company_Emp_Contact.company_id, Emp_Contact.lname, Emp_Contact.name
</cfquery>
</cfsilent>

