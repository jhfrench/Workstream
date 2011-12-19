
<!--Reports/qry_leader_hours_by_month.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I query the database for the information for the leadership hours report.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/03 19:08:49  french
	Removed logic that restricted weekly sum results to projects that user could see; this isn't necessary and it was actually causing a cartesion becase Project_Visible_To had some duplicates. Task 30220

	Revision 1.0  2005-02-15 15:57:49-05  daugherty
	Initial revision

	Revision 1.3  2001-12-02 17:58:16-05  french
	Formatting changes.

	Revision 1.2  2001-11-06 12:21:11-05  long
	Bug fix, removed an extra close cfslient tag
	
	Revision 1.1  2001-10-11 11:03:57-04  long
	Added $log $ for edits to all CFM files that have fusedocs.

	(KL|8/8/01) ; removed logic that only shows hours for visible codes, because you should be able to see all codes that you have time entered under. 
	||
	END FUSEDOC --->
<cfquery name="Agg_hours_by_month" datasource="#application.datasources.main#">
SELECT SUM(Time_Entry.Hours) AS sumofhours, MONTH(Time_Entry.Date) AS month, 
	YEAR(Time_Entry.Date) AS year, Emp_Contact.lname + ', ' + Emp_Contact.name AS name, 
	(Customers.description + '-' + Project.description + '(' + Project.project_code + ')') AS clientname
FROM Time_Entry, Emp_Contact, Project, Customers
WHERE Customers.customers_id=Project.customers_id
	AND Time_Entry.Project_id=Project.project_id
	AND Time_Entry.Emp_ID=Emp_Contact.Emp_ID
	AND emp_contact.emp_id=#attributes.emp_id# 
	AND MONTH(time_entry.[date])=#attributes.month#
	AND YEAR(time_entry.[date])=#attributes.year#
GROUP BY Customers.description, Project.project_code, 
	Emp_Contact.name, Emp_Contact.lname, Project.description, 
	MONTH(Time_Entry.Date), YEAR(Time_Entry.Date)
ORDER BY clientname
</cfquery>

<cfquery name="Agg_hours_by_week" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname + ', ' + Emp_Contact.name AS name, SUM(Time_Entry.Hours) AS Sumofhours, 
	MONTH(Time_Entry.date) AS month, YEAR(Time_Entry.date) AS year, 
	DATEPART(WEEK, Time_Entry.Date) AS week
FROM Emp_Contact, Time_Entry, Project
WHERE Emp_Contact.emp_id=Time_Entry.emp_id
	AND Time_Entry.project_id=Project.project_id
	AND Emp_Contact.emp_id=#attributes.emp_id#
	AND MONTH(Time_Entry.date)=#attributes.month# 
	AND YEAR(Time_Entry.date)=#attributes.year#
GROUP BY MONTH(Time_Entry.date), YEAR(Time_Entry.date), DATEPART(WEEK, Time_Entry.Date), Emp_Contact.name, Emp_Contact.lname
</cfquery>
</cfsilent>


<!--- <cfquery name="Agg_hours_by_month" datasource="#application.datasources.main#">
SELECT SUM(Time_Entry.Hours) AS Sumofhours, DATEPART(month, 
    time_entry.date) AS month, DATEPART(year, time_entry.date) 
    AS [year], Emp_Contact.Name, 
    Project.Description + '(' + Project.Project_Code + ')' AS clientname
FROM Time_Entry INNER JOIN
    Emp_Contact ON 
    Time_Entry.Emp_ID = Emp_Contact.Emp_ID INNER JOIN
    Project ON Time_Entry.Project_id = Project.project_id INNER JOIN
    Customer_Visible_To ON 
    Project.Project_Code = Customer_Visible_To.Code
WHERE emp_contact.emp_id =#attributes.emp_id# and customer_visible_to.visible_to IN (#session.workstream_company_select_list#)
and project.Project_code=customer_visible_to.code
 and
DatePart(month,time_entry.[date]) = #attributes.month#
and
DatePart(year,time_entry.[date]) = #attributes.year#
GROUP BY  Project.Project_Code, Emp_Contact.Name,
    Project.Description, DATEPART(month, 
    Time_Entry.Date) , DATEPART(year, Time_Entry.Date)
ORDER BY clientname
</cfquery>

<cfquery name="Agg_hours_by_week" datasource="#application.datasources.main#">
SELECT SUM(Time_Entry.Hours) AS Sumofhours, DATEPART(month, 
    Time_Entry.Date) AS month, DATEPART(year, Time_Entry.Date) 
    AS year, DATEPART(WEEK, Time_Entry.Date) AS week, 
    Emp_Contact.name
FROM Emp_Contact, Time_Entry, Project, Customer_Visible_To
WHERE Emp_Contact.emp_id = Time_Entry.emp_id
	AND Time_Entry.project_id = Project.project_id
	AND Project.project_code = Customer_Visible_To.code
	AND Emp_Contact.emp_id = #attributes.emp_id#
	AND customer_visible_to.visible_to IN (#session.workstream_company_select_list#)
	AND Project.project_code = Customer_Visible_To.code 
	AND DATEPART(month, Time_Entry.date) = #attributes.month# 
	AND DATEPART(year, Time_Entry.date) = #attributes.year#
GROUP BY DATEPART(month, Time_Entry.date), DATEPART(year, Time_Entry.date), 
	DATEPART(WEEK, Time_Entry.Date), Emp_Contact.name
</cfquery> --->
