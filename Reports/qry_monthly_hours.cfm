<!--reports/qry_monthly_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the billable and non billable monthly hours reports.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfparam name="session.workstream_project_list_order" default="1">
<cfparam name="Flag_Non_Billable" default="False">
<cfquery name="monthly_hours" datasource="#application.datasources.main#">
SELECT Emp_Contact.name, Emp_Contact.lname, Project.project_code AS clientcode,
	CASE
		WHEN Customer.description != Project.description
	<cfif session.workstream_project_list_order EQ 2>
			THEN (Project.project_code + ' - ' + Customer.description + ' - ' + Project.description)
		ELSE (Project.project_code + ' - ' + Project.description)
	<cfelse>
			THEN (Customer.description + ' - ' + Project.description + ' (' + Project.project_code + ')')
		ELSE (Project.description + ' (' + Project.project_code + ')')
	</cfif>END AS clientname, REF_Employee_Classification.employee_classification,
	SUM(Time_Entry.hours) AS hours, Link_Company_Emp_Contact.company_id
FROM Emp_Contact, Time_Entry, Project,
	Demographics_Ngauge Demographics, Customer, Link_Company_Emp_Contact,
	REF_Employee_Classification
WHERE Emp_Contact.emp_id=Time_Entry.emp_id
	AND Time_Entry.project_id=Project.project_id
	AND Time_Entry.emp_id=Demographics.emp_id
	AND Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
	AND Project.customer_id=Customer.customer_id
	AND Demographics.employee_classification_id*=REF_Employee_Classification.employee_classification_id
	AND Time_Entry.date BETWEEN Demographics.effective_from AND ISNULL(Demographics.effective_to, Time_Entry.date)
	AND Demographics.effective_from <= #variables.through_date#
	AND ISNULL(Demographics.effective_to,#variables.from_date#) >= #variables.from_date#
	AND Time_Entry.date BETWEEN #variables.from_date# AND #variables.through_date#
	AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
	AND Project.billable_type_id IN (<cfif flag_non_billable>2<cfelse>1, 3, 4</cfif>)
GROUP BY Emp_Contact.name, Emp_Contact.lname,
	CASE
		WHEN Customer.description != Project.description
		<cfif session.workstream_project_list_order EQ 2>
			THEN (Project.project_code + ' - ' + Customer.description + ' - ' + Project.description)
		ELSE (Project.project_code + ' - ' + Project.description)
		<cfelse>
			THEN (Customer.description + ' - ' + Project.description + ' (' + Project.project_code + ')')
		ELSE (Project.description + ' (' + Project.project_code + ')')
	</cfif>END, Project.project_code,
	REF_Employee_Classification.employee_classification, Link_Company_Emp_Contact.company_id
ORDER BY employee_classification, clientname, lname
</cfquery>
</cfsilent>

