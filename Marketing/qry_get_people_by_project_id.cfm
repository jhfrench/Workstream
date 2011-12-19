
<!--Marketing/qry_get_people_by_project_id.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery name="get_people_by_project_id" datasource="#application.datasources.main#">
SELECT Email.Email, Phone.Phone_Number, Phone.Extension, 
	project.project_id, Location.Address1, Location.Address2,
	Location.City, Location.State, Location.Zip,
	Emp_Contact.LName, Emp_Contact.Name, Emp_Contact.emp_id, 
	Project.project_code, Project.Description
FROM Emp_Contact
	INNER JOIN Marketing_Emp ON Emp_Contact.emp_id = Marketing_Emp.emp_id
	INNER JOIN Project ON Marketing_Emp.project_id = Project.project_id
	LEFT OUTER JOIN Email ON Emp_Contact.emp_id = Email.emp_id
		AND Email.email_type_id = 1
	LEFT OUTER JOIN  Location ON Location.Location_Type_Id = 1
		AND Emp_Contact.emp_id = Location.emp_id
	LEFT OUTER JOIN  Phone ON Phone.Phone_type_id = 1
		AND Emp_Contact.emp_id = Phone.emp_id
WHERE (Marketing_Emp.project_id = #cfgridkey#)
</cfquery>
