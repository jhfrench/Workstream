
<!--Marketing/qry_get_people_by_project_id.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:51:18  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:42-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="get_people_by_project_id" datasource="#application.datasources.main#">
    SELECT Email.Email, Phone.Phone_Number, Phone.Extension, 
    project.project_id, Location.Address1, Location.Address2, Location.City, 
    Location.State, Location.Zip, Emp_Contact.LName, 
    Emp_Contact.Name, Emp_Contact.Emp_ID, 
    Project.project_code, Project.Description
FROM Emp_Contact INNER JOIN
    Marketing_Emp ON 
    Emp_Contact.Emp_ID = Marketing_Emp.Emp_id INNER JOIN
    Project ON 
    Marketing_Emp.Project_id = Project.project_id LEFT OUTER JOIN
    Email ON Emp_Contact.Emp_ID = Email.Emp_ID AND 
    Email.Email_Type_ID = 1 LEFT OUTER JOIN
    Location ON Location.Location_Type_Id = 1 AND 
    Emp_Contact.Emp_ID = Location.Emp_ID LEFT OUTER JOIN
    Phone ON Phone.Phone_type_id = 1 AND 
    Emp_Contact.Emp_ID = Phone.Emp_ID
WHERE (Marketing_Emp.Project_id = #cfgridkey#)
</cfquery>
