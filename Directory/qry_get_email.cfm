
<!-- Directory/qry_get_email.cfm
	Author: Jeromy French-->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I query database for employees to send emails to.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	<-- first_name: string that contains first name of the user
	<-- last_name: string that contains last name of the user
	<-- email: string that contains email address of the user
 --->

<cfquery name="get_emails" datasource="#application.datasources.main#">
SELECT Ec.Name AS fname, Ec.LName, Em.Email
FROM Email Em
	INNER JOIN Emp_Contact Ec ON Em.emp_id = Ec.emp_id
	LEFT OUTER JOIN REF_Email_Type Ret ON Em.email_type_id = Ret.email_type_id
	INNER JOIN Link_Company_Emp_Contact ON Link_Company_Emp_Contact.emp_id = Ec.emp_id
	INNER JOIN REF_Company RCom ON Link_Company_Emp_Contact.company_id = RCom.company_id
WHERE Ret.email_type_id = 1
	AND RCom.PTO_Accrual_Type_ID IS NOT NULL
</cfquery>
</cfsilent>


