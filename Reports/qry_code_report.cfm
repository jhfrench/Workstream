
<!--Reports/qry_code_report.cfm
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
<cfquery name="#query#" datasource="#application.datasources.main#">
SELECT Emp_Contact.name, Emp_Contact.lname, 
	Project.project_code AS clientcode, 
	Project.description AS clientname, 
	REF_Employee_Classification.employee_classification,
	<cfif isdefined("variables.month_loop")><cfloop from="1" to="#variables.month_loop#" index="ii"><cfset variables.current_month=dateformat(dateadd("m",ii-1,variables.from_date), "mm/yyyy")>SUM(CASE WHEN MONTH(Time_Entry.date)=#month(variables.current_month)# AND YEAR(Time_Entry.date)=#year(variables.current_month)# THEN Time_Entry.hours ELSE 0 END) AS 'period_#ii#',
	</cfloop></cfif>SUM(Time_Entry.hours) AS hours, 
	REF_Company.description AS company
FROM Emp_Contact 
		INNER JOIN Time_Entry ON Emp_Contact.emp_id = Time_Entry.emp_id
		INNER JOIN Demographics_Ngauge AS Demographics ON Emp_Contact.emp_id = Demographics.emp_id
			AND Time_Entry.date BETWEEN Demographics.effective_from AND COALESCE(Demographics.effective_to, #createODBCDate(attributes.through_date)#)
		INNER JOIN Project ON Time_Entry.project_id = Project.project_id
		INNER JOIN Customer ON Project.customer_id = Customer.customer_id
		INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id = Link_Company_Emp_Contact.emp_id
		INNER JOIN REF_Company ON Link_Company_Emp_Contact.company_id = REF_Company.company_id
		LEFT OUTER JOIN REF_Employee_Classification
			ON Demographics.employee_classification_id = REF_Employee_Classification.employee_classification_id
WHERE Time_Entry.date BETWEEN #CreateODBCDate(attributes.from_date)# AND #CreateODBCDate(attributes.through_date)#
	AND Project.project_id = #project_id#
	AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
	AND Demographics.effective_from <= #CreateODBCDate(attributes.through_date)#
	AND COALESCE(Demographics.effective_to, #CreateODBCDate(attributes.from_date)#) >= #CreateODBCDate(attributes.from_date)#
GROUP BY Emp_Contact.name, Emp_Contact.lname, 
	Project.description, Project.project_code, 
	REF_Employee_Classification.employee_classification, 
	REF_Company.description
ORDER BY REF_Employee_Classification.employee_classification, Project.project_code, Emp_Contact.lname
</cfquery>
</cfsilent>
