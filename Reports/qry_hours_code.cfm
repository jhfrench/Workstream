
<!--Reports/qry_hours_code.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the hours by code report.

	||
	Edits:
	$Log$
	Revision 1.2  2005/05/02 15:23:20  french
	Modified report to better handle historical data, particularly for employees who have left the company or have experienced a demographics update. The old demographics record was being eliminated (and the data joined to it) because it was not the active (effective_to=NULL) demographics record. Task 31799

	Revision 1.1  2005-03-09 13:13:47-05  stetzer
	<>

	||
	END FUSEDOC --->
<cfquery name="Hours_Code" datasource="#application.datasources.main#">
SELECT SUM(Time_Entry.hours) AS hours, Project.project_code AS clientcode, 
	Project.description AS clientname, 
	ISNULL(REF_Employee_Classification.employee_classification, 'Unknown') AS employee_classification
FROM Emp_Contact
	INNER JOIN Time_Entry ON Emp_Contact.emp_id=Time_Entry.emp_id
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN Company ON Emp_Contact.emp_id=Company.emp_id 
	INNER JOIN REF_Company ON Company.company=REF_Company.company_id
	INNER JOIN Demographics ON Emp_Contact.emp_id=Demographics.emp_id
	LEFT OUTER JOIN REF_Employee_Classification ON Demographics.employee_classification_id=REF_Employee_Classification.employee_classification_id
WHERE Time_Entry.date BETWEEN #variables.from_date# AND #variables.through_date#
	AND Company.company IN (#session.workstream_company_select_list#)
	AND Time_Entry.date BETWEEN Demographics.effective_from AND ISNULL(Demographics.effective_to, Time_Entry.date)
GROUP BY Project.project_code, Project.description, REF_Employee_Classification.employee_classification
ORDER BY clientcode
</cfquery>
</cfsilent>
