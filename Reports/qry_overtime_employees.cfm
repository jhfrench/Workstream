
<!--Reports/qry_overtime_employees.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the list of people that are elligible for overtime.  For the overtime report imput screen

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_overtime_employees" datasource="#application.datasources.main#"> 
SELECT Emp_Contact.name, Emp_Contact.lname, 
    Demographics.pin, Demographics.emp_id
FROM Demographics
	INNER JOIN Emp_Contact ON Demographics.emp_id=Emp_Contact.emp_id
	INNER JOIN Link_User_Account_Status ON Link_User_Account_Status.user_account_id=Emp_Contact.emp_id
		AND Link_User_Account_Status.active_ind=1
		AND Link_User_Account_Status.account_status_id=1 /*active*/
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
		AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
WHERE Demographics.effective_to IS NULL
	AND Demographics.overtime = 1
ORDER BY Emp_Contact.lname, Emp_Contact.name
</cfquery>
</cfsilent>
