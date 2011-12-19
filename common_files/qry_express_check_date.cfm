
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
	Revision 1.0  2005/02/15 20:41:55  daugherty
	Initial revision

	Revision 1.2  2002-03-18 11:18:57-05  french
	Adding code to account for a user entering time before they are a valid employee (as determiend by demographics.effective_from).

	Revision 1.1  2001-10-11 10:54:50-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
 --->
<cfquery name="express_check_date" datasource="#application.datasources.main#">
SELECT ISNULL(MAX(Date_Locked.date_locked), GETDATE()) AS date_locked
FROM Emp_Contact, Company, Date_Locked, Demographics_Ngauge AS Demographics
WHERE Emp_Contact.emp_id=#session.user_account_id# 
	AND (Demographics.effective_to IS NULL OR Demographics.effective_to > GETDATE())
	AND (Demographics.effective_from IS NULL OR Demographics.effective_from < GETDATE())
	AND Emp_Contact.emp_id=Company.emp_id
	AND Company.company=Date_Locked.company_id
	AND Emp_Contact.emp_id=Demographics.emp_id
</cfquery>
</cfsilent>

