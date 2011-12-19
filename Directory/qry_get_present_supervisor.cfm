
<!--Directory/qry_get_present_supervisor.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve supervisor history based on the needs of the user.
	||
	Name: Damon Scott
	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:47:11  daugherty
	Initial revision

	Revision 1.1  2001-10-11 12:20:54-04  long
	Added FuseDoc

	||
	Variables:
	--> attributes.emp_id: number containing the unique identifier of the individual being requested

 --->
<cfquery name="get_present_supervisor" datasource="#application.datasources.main#">
SELECT ISNULL(Emp_Contact.lname + ', ' + Emp_Contact.name, 'NA') AS sup_name, Emp_Contact.emp_id
FROM Emp_Contact, Link_Employee_Supervisor
WHERE Emp_Contact.emp_id=Link_Employee_Supervisor.supervisor_id
	AND Link_Employee_Supervisor.emp_id=#attributes.emp_id#
	AND Link_Employee_Supervisor.date_end IS NULL
ORDER BY Link_Employee_Supervisor.date_start DESC
</cfquery>
</cfsilent>
