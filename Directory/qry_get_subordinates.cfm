
<!--- 
	--> application.team_changed: date of the last time emp_contact, security or demographics tables were changed
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
	<-- emp_id: number containing the unique identifier of the individual being requested
	<-- fname: string containing the second address line for a person
	<-- lname: string containing the first address line for a person
 --->
<cfquery name="get_subordinates" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname AS lname, Emp_Contact.name AS fname, Emp_Contact.emp_id
FROM Emp_Contact, Link_Employee_Supervisor, Security
WHERE Link_Employee_Supervisor.emp_id=Emp_Contact.emp_id
	AND Security.emp_id=Emp_Contact.emp_id
	AND Link_Employee_Supervisor.supervisor_id = #attributes.emp_id#
	AND GETDATE() BETWEEN Link_Employee_Supervisor.date_start AND ISNULL(Link_Employee_Supervisor.date_end, DATEADD(d,1,GETDATE()))
	AND Security.disable!=1
ORDER BY lname, name
</cfquery>
</cfsilent>

