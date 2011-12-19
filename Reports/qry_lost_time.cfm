  
  <!--reports/qry_lost_time.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:14:00  stetzer
<>

Revision 1.1  2001-10-11 11:03:56-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
    <cfquery name="Sick_Hours" datasource="#application.datasources.main#">  
    SELECT Emp_Contact.Name, Emp_Contact.LName, 
    Emp_Contact.Emp_ID, Demographics.pin, '24.00' AS allowed, 
    SUM(CASE WHEN project_code = 20 OR
    project_code = 1020 OR
    project_code = 2020 OR
    project_code = 3020 OR
    project_code = 4020 OR
    project_code = 5020 OR
    project_code = 7020 OR
    project_code = 8020 OR
    project_code = 9020 THEN (hours) ELSE 0 END) 
    + SUM(CASE WHEN project_code = 24 OR
    project_code = 1024 OR
    project_code = 2024 OR
    project_code = 3024 OR
    project_code = 4024 OR
    project_code = 5024 OR
    project_code = 7024 OR
    project_code = 8024 THEN (hours) ELSE 0 END) 
    + SUM(CASE WHEN project_code = 21 OR
    project_code = 1021 OR
    project_code = 2021 OR
    project_code = 3021 OR
    project_code = 4021 OR
    project_code = 5021 OR
    project_code = 7021 OR
    project_code = 8021 OR
    project_code = 9021 THEN (hours) ELSE 0 END) 
    AS Time_used, SUM(CASE WHEN project_code = 20 OR
    project_code = 1020 OR
    project_code = 2020 OR
    project_code = 3020 OR
    project_code = 4020 OR
    project_code = 5020 OR
    project_code = 7020 OR
    project_code = 8020 OR
    project_code = 9020 THEN (hours) ELSE 0 END) AS Sick, 
    SUM(CASE WHEN project_code = 24 OR
    project_code = 1024 OR
    project_code = 2024 OR
    project_code = 3024 OR
    project_code = 4024 OR
    project_code = 5024 OR
    project_code = 7024 OR
    project_code = 8024 THEN (hours) ELSE 0 END) 
    AS Unauthorized_hours, 
    SUM(CASE WHEN project_code = 21 OR
    project_code = 1021 OR
    project_code = 2021 OR
    project_code = 3021 OR
    project_code = 4021 OR
    project_code = 5021 OR
    project_code = 7021 OR
    project_code = 8021 OR
    project_code = 9021 THEN (hours) ELSE 0 END) 
    AS Personal_hours, 
    24.00 - SUM(CASE WHEN project_code = 20 OR
    project_code = 1020 OR
    project_code = 2020 OR
    project_code = 3020 OR
    project_code = 4020 OR
    project_code = 5020 OR
    project_code = 7020 OR
    project_code = 8020 OR
    project_code = 9020 THEN (hours) ELSE 0 END) 
    + SUM(CASE WHEN project_code = 24 OR
    project_code = 1024 OR
    project_code = 2024 OR
    project_code = 3024 OR
    project_code = 4024 OR
    project_code = 5024 OR
    project_code = 7024 OR
    project_code = 8024 THEN (hours) ELSE 0 END) 
    + SUM(CASE WHEN project_code = 21 OR
    project_code = 1021 OR
    project_code = 2021 OR
    project_code = 3021 OR
    project_code = 4021 OR
    project_code = 5021 OR
    project_code = 7021 OR
    project_code = 8021 OR
    project_code = 9021 THEN (hours) ELSE 0 END) 
    AS Remaining
FROM Emp_Contact INNER JOIN
    Time_Entry ON 
    Emp_Contact.Emp_ID = Time_Entry.Emp_ID INNER JOIN
    Demographics ON 
    Emp_Contact.Emp_ID = Demographics.Emp_ID INNER JOIN
    Company ON 
    Emp_Contact.Emp_ID = Company.Emp_ID INNER JOIN
    REF_companies ON 
    Company.Company = REF_companies.Company_ID INNER JOIN
    Project ON Time_Entry.Project_id = Project.project_id
WHERE REF_companies.company  IN (#session.workstream_company_select_list#) and demographics.end_date IS NULL and datepart(yy,time_entry.date) = datepart(yy, GETDATE())
GROUP BY emp_contact.lname, emp_contact.name, 
    demographics.pin, emp_contact.emp_ID
ORDER BY emp_contact.lname
</cfquery>
