
<!--common_files/qry_team_select.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve team members based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.team_changed: date of the last time emp_contact, security or demographics tables were changed
	--> session.workstream_company_id: id that identifies company of the user to workstream
	--> session.workstream_selected_company_id: id of the companies that the employee wishes to see
	<-- company: number that contains the REF_Company.company_id for an employee
	<-- emp_id: id that identifies user to workstream
	<-- f_init: string containing the first initial of an employee
	<-- lname: string containing the last name of an employee
 --->
<cfparam name="session.workstream_selected_company_id" default="#session.workstream_company_id#">
<cfparam name="variables.emp_id_match" default="">
<cfparam name="attributes.all_employees" default="0">
<cfquery name="team_select" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT Emp_Contact.emp_id AS emp_id, Emp_Contact.lname, LEFT(Emp_Contact.name,2) AS f_init, 
	Emp_Contact.name, ISNULL(Emp_Contact.lname,'')+', '+LEFT(ISNULL(Emp_Contact.name,''),2) AS display<cfif isdefined("variables.email_only")>, email_type_id</cfif>
FROM Emp_Contact, Link_Company_Emp_Contact, Security<cfif isdefined("variables.email_only")>, Email</cfif>
WHERE Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id<cfif isdefined("variables.email_only")>
	AND Emp_Contact.emp_id=Email.emp_id
	AND Email.email_type_id=1</cfif>
	AND Emp_Contact.emp_id=Security.emp_id
	AND (Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)<cfif NOT attributes.all_employees>
		AND Security.disable=0</cfif><cfif len(variables.emp_id_match)>
	OR Emp_Contact.emp_id IN (#variables.emp_id_match#)</cfif>)
	AND #application.team_changed#=#application.team_changed#
GROUP BY Emp_Contact.emp_id, Emp_Contact.lname, 
	LEFT(Emp_Contact.name,2), Emp_Contact.name<cfif isdefined("variables.email_only")>, email_type_id</cfif>
ORDER BY lname, name<cfif isdefined("variables.email_only")>, email_type_id</cfif>
</cfquery>
</cfsilent>
