
<!--Reports/qry_hours_code.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the hours by code report.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery name="Hours_Code" datasource="#application.datasources.main#">
SELECT SUM(Time_Entry.hours) AS hours, Project.project_code AS clientcode, 
	Project.description AS clientname, 
	COALESCE(REF_Employee_Classification.employee_classification, 'Unknown') AS employee_classification
FROM Emp_Contact
	INNER JOIN Time_Entry ON Emp_Contact.emp_id=Time_Entry.emp_id
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id 
	INNER JOIN REF_Company ON Link_Company_Emp_Contact.company_id=REF_Company.company_id
	INNER JOIN Demographics_Ngauge AS Demographics ON Emp_Contact.emp_id=Demographics.emp_id
	LEFT OUTER JOIN REF_Employee_Classification ON Demographics.employee_classification_id=REF_Employee_Classification.employee_classification_id
WHERE Time_Entry.date BETWEEN #variables.from_date# AND #variables.through_date#
	AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
	AND Time_Entry.date BETWEEN Demographics.effective_from AND COALESCE(Demographics.effective_to, Time_Entry.date)
GROUP BY Project.project_code, Project.description, REF_Employee_Classification.employee_classification
ORDER BY clientcode
</cfquery>
</cfsilent>
