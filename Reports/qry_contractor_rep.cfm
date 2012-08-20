
<!--Reports/qry_contractor_rep.cfm
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
 <cfquery name="get_Employee_ID" datasource="#application.datasources.main#">
SELECT Emp_Contact.emp_id, Emp_Contact.Name, Emp_Contact.lname,
	Demographics.pin, REF_Company.description AS company,
	CASE
		WHEN Link_User_Account_Status.account_status_id=1 THEN 'Active'
		ELSE 'Inactive'
	END AS status
FROM Demographics_Ngauge AS Demographics
	INNER JOIN Emp_Contact ON Demographics.emp_id=Emp_Contact.emp_id
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
	INNER JOIN REF_Company ON Link_Company_Emp_Contact.company_id = REF_Company.company_id
	INNER JOIN Link_User_Account_Status ON Link_User_Account_Status.user_account_id=Emp_Contact.emp_id
		AND Link_User_Account_Status.active_ind=1
WHERE Demographics.employee_classification_id = 4
	AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
	AND Demographics.effective_to IS NULL
</cfquery>