
<!-- directory/qry_get_email.cfm
	Author: Victor B.-->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I query database for employees to send emails to.
	||
	Name: Victor Blell
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:47:01  daugherty
Initial revision

Revision 1.0  2003-03-21 11:38:27-05  blell
created template

	
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	<-- first_name: string that contains first name of the user
	<-- last_name: string that contains last name of the user
	<-- email: string that contains email address of the user
 --->

<cfquery name="get_emails" datasource="#application.datasources.main#">
SELECT Ec.Name AS fname, Ec.LName, Em.Email
FROM Email Em INNER JOIN
    Emp_Contact Ec ON 
    Em.Emp_ID = Ec.Emp_ID LEFT OUTER JOIN
    REF_Email_Type Ret ON 
    Em.Email_Type_ID = Ret.Email_Type_ID INNER JOIN
    Company Com ON Com.Emp_ID = Ec.Emp_ID INNER JOIN
    REF_Companies RCom ON 
    Com.Company = RCom.Company_ID
WHERE Ret.Email_Type_ID = 1
	AND RCom.PTO_Accrual_Type_ID IS NOT NULL
</cfquery>
</cfsilent>


