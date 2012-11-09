
<!--common_files/qry_express_check_date.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the initials of the user as well as the date that the database time entries have been limited to.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfquery name="express_check_date" datasource="#application.datasources.main#">
SELECT COALESCE(MAX(Date_Locked.date_locked), CURRENT_TIMESTAMP) AS date_locked
FROM Emp_Contact
	INNER JOIN Link_Company_User_Account ON Emp_Contact.user_account_id=Link_Company_User_Account.user_account_id
	INNER JOIN Date_Locked ON Link_Company_User_Account.company_id=Date_Locked.company_id
		AND Date_Locked.active_ind=1
	INNER JOIN View_Demographics_Workstream AS Demographics ON Emp_Contact.user_account_id=Demographics.user_account_id
WHERE Emp_Contact.user_account_id=#variables.user_identification# 
	AND (Demographics.effective_to IS NULL OR Demographics.effective_to > CURRENT_TIMESTAMP)
	AND (Demographics.hire_date IS NULL OR Demographics.hire_date < CURRENT_TIMESTAMP)
</cfquery>
</cfsilent>