
<!--Directory/qry_get_emp_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:47:05  daugherty
	Initial revision

	Revision 1.1  2001-10-11 12:20:54-04  long
	Added FuseDoc

	||
	Variables:
	--> application.team_changed: date of the last time emp_contact, security or demographics tables were changed
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
	<-- lname: string containing the last name of an employee
	<-- fname: string containing the first name of an employee
 --->
<cfquery name="get_emp_details" datasource="#application.datasources.main#">
SELECT Emp_Contact.name AS fname, Emp_Contact.lname AS lname, 
	Demographics.ssn AS ssn, Demographics.dob, 
	Demographics.hire_date, ISNULL(Demographics.photo,'nopic.jpg') AS photo, Demographics.end_date,
	<!--- Demographics.supervisor AS sup_id, Supervisor.sup_name, --->
	ISNUll(Emp_Contact.credentials,'') AS credentials, Emp_Biography.biography
FROM Emp_Contact, Demographics, Emp_Biography,
	(SELECT ISNULL((lname + ', ' + name),'NA') AS sup_name, Demographics.emp_id as emp_id
	FROM Emp_Contact, Demographics
	WHERE Emp_Contact.emp_id=*Demographics.supervisor
		<cfif isdefined("attributes.emp_id") and len(attributes.emp_id)>
		AND Demographics.emp_id=#attributes.emp_id#
		</cfif>
		AND Demographics.effective_to IS NULL)
AS Supervisor
WHERE Emp_Contact.emp_id=Demographics.emp_id
	AND Emp_Contact.emp_id=Supervisor.emp_id
	AND Demographics.effective_to IS NULL
	AND Emp_Contact.emp_id*=Emp_Biography.emp_id
</cfquery>

	
</cfsilent>
