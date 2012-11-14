
<!-- Directory/qry_get_active_employee_email.cfm
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

<cfquery name="get_active_employee_email" datasource="#application.datasources.main#">
SELECT Ec.Name AS fname, Ec.lname, Em.Email
FROM Email Em
	INNER JOIN Emp_Contact Ec ON Em.user_account_id=Ec.user_account_id
	LEFT OUTER JOIN REF_Email_Type Ret ON Em.email_type_id = Ret.email_type_id
	INNER JOIN Link_Company_User_Account ON Link_Company_User_Account.user_account_id=Ec.user_account_id
	INNER JOIN REF_Company RCom ON Link_Company_User_Account.company_id = RCom.company_id
WHERE Ret.email_type_id = 1
	AND RCom.PTO_Accrual_Type_ID IS NOT NULL
</cfquery>
</cfsilent>

