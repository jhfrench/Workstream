
<!--Directory/qry_get_subordinates.cfm
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
	||
	Variables:
	--> application.team_changed: date of the last time emp_contact, security or demographics tables were changed
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
	<-- emp_id: number containing the unique identifier of the individual being requested
	<-- fname: string containing the second address line for a person
	<-- lname: string containing the first address line for a person
	END FUSEDOC --->
</cfsilent>

<cfquery name="get_subordinates" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname AS lname, Emp_Contact.name AS fname, Emp_Contact.emp_id
FROM Emp_Contact
	INNER JOIN Link_Employee_Supervisor ON Emp_Contact.emp_id=Link_Employee_Supervisor.emp_id
		AND Link_Employee_Supervisor.supervisor_id=#attributes.emp_id#
		AND CURRENT_TIMESTAMP BETWEEN Link_Employee_Supervisor.date_start AND COALESCE(Link_Employee_Supervisor.date_end, CURRENT_TIMESTAMP+'1 day')
	INNER JOIN Link_User_Account_Status ON Link_Employee_Supervisor.emp_id=Link_User_Account_Status.user_account_id
		AND Link_User_Account_Status.active_ind=1
		AND Link_User_Account_Status.account_status_id=1 /*active*/
ORDER BY lname, name
</cfquery>
