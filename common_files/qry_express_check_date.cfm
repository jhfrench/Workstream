
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
SELECT ISNULL(MAX(Date_Locked.date_locked), GETDATE()) AS date_locked
FROM Emp_Contact, Link_Emp_Contact_Employer, Date_Locked,
	Demographics_Ngauge AS Demographics
WHERE Emp_Contact.emp_id=#session.user_account_id# 
	AND (Demographics.effective_to IS NULL OR Demographics.effective_to > GETDATE())
	AND (Demographics.effective_from IS NULL OR Demographics.effective_from < GETDATE())
	AND Emp_Contact.emp_id=Link_Emp_Contact_Employer.emp_id
	AND Link_Emp_Contact_Employer.company_id=Date_Locked.company_id
	AND Emp_Contact.emp_id=Demographics.emp_id
</cfquery>
</cfsilent>

