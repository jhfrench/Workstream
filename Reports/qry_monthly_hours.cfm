<!--reports/qry_monthly_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the billable and non billable monthly hours reports.

	||
	Edits:
	$Log$
	Revision 1.2  2005/03/18 15:19:31  french
	Adding customer description to project name display.

	Revision 1.1  2005-03-09 13:14:15-05  stetzer
	<>

	Revision 1.3  2002-02-18 09:56:46-05  long
	Added code to allow a user to have mulitple demographic records and not double the records returned.

	Revision 1.2  2002-01-17 08:24:23-05  long
	Added changes to accomidate the effective from and to dates in Demographics table.  The query now accuratly represents the point in time for each employeee when the query is run for.
	
	Revision 1.1  2001-10-11 11:03:54-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	
	(JF | 2/8/2) Reformatted query for speeed.
	(KL | 8/7/01) added logic to include the flat rate codes in the billable hours report.
	||
	END FUSEDOC --->
<cfparam name="session.workstream_project_list_order" default="1">
<cfparam name="Flag_Non_Billable" default="False">
<cfquery name="monthly_hours" datasource="#application.datasources.main#">
SELECT Emp_Contact.name, Emp_Contact.lname, Project.project_code AS clientcode,
	CASE
		WHEN Customers.description != Project.description
	<cfif session.workstream_project_list_order EQ 2>
			THEN (Project.project_code + ' - ' + Customers.description + ' - ' + Project.description)
		ELSE (Project.project_code + ' - ' + Project.description)
	<cfelse>
			THEN (Customers.description + ' - ' + Project.description + ' (' + Project.project_code + ')')
		ELSE (Project.description + ' (' + Project.project_code + ')')
	</cfif>END AS clientname, REF_Employee_Classification.employee_classification,
	SUM(Time_Entry.hours) AS hours, Company.company
FROM Emp_Contact, Time_Entry, Project,
	Demographics_Ngauge Demographics, Customers, Company,
	REF_Employee_Classification
WHERE Emp_Contact.emp_id=Time_Entry.emp_id
	AND Time_Entry.Project_id=Project.project_id
	AND Time_Entry.emp_id=Demographics.emp_id
	AND Emp_Contact.emp_id=Company.emp_id
	AND Project.customers_id=Customers.customers_id
	AND Demographics.employee_classification_id*=REF_Employee_Classification.employee_classification_id
	AND Time_Entry.date BETWEEN Demographics.effective_from AND ISNULL(Demographics.effective_to, Time_Entry.date)
	AND Demographics.effective_from <= #variables.through_date#
	AND ISNULL(Demographics.effective_to,#variables.from_date#) >= #variables.from_date#
	AND Time_Entry.date BETWEEN #variables.from_date# AND #variables.through_date#
	AND Company.company IN (#session.workstream_company_select_list#)
	AND Project.billable_id IN (<cfif flag_non_billable>2<cfelse>1, 3, 4</cfif>)
GROUP BY Emp_Contact.name, Emp_Contact.lname,
	CASE
		WHEN Customers.description != Project.description
		<cfif session.workstream_project_list_order EQ 2>
			THEN (Project.project_code + ' - ' + Customers.description + ' - ' + Project.description)
		ELSE (Project.project_code + ' - ' + Project.description)
		<cfelse>
			THEN (Customers.description + ' - ' + Project.description + ' (' + Project.project_code + ')')
		ELSE (Project.description + ' (' + Project.project_code + ')')
	</cfif>END, Project.project_code,
	REF_Employee_Classification.employee_classification, Company.company
ORDER BY employee_classification, clientname, lname
</cfquery>
</cfsilent>

