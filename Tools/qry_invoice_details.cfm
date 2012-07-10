
<!--Tools/qry_invoice_details.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all the modules that a user is allowed to see.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	END FUSEDOC --->
<cfquery name="invoice_details" datasource="#application.datasources.main#">
SELECT Hours_ID.project_id, Hours_ID.hours, COALESCE(Billing_Rate.rate,0) AS rate,
	(Hours_ID.hours*COALESCE(Billing_Rate.rate,0)) AS bill, 
	Hours_ID.emp_id, (Emp_Contact.lname || ', ' || Emp_Contact.name) AS name, 
	Demographics.pin, Project.project_code, Project.description AS project_name
FROM Project, Billing_Rate, Emp_Contact, Demographics_Ngauge Demographics,
	(SELECT SUM(Hours) AS hours, project_id, Time_Entry.emp_id
	FROM Time_Entry, Link_Company_Emp_Contact
	WHERE Time_Entry.emp_id=Link_Company_Emp_Contact.emp_id
		AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
		AND DATEPART(m, Time_Entry.date)=#attributes.month#
		AND DATEPART(yyyy, Time_Entry.date)=#attributes.year#
	GROUP BY project_id, Time_Entry.emp_id)
	AS Hours_ID
WHERE Project.project_id=Hours_ID.project_id
	AND Billing_Rate.emp_id=*Hours_ID.emp_id
	AND Project.project_id*=Billing_Rate.project_id
	AND Hours_ID.emp_id=Emp_Contact.emp_id
	AND Hours_ID.emp_id=Demographics.emp_id
	AND ('#attributes.month#/1/#attributes.year#' BETWEEN Billing_Rate.rate_start_date AND Billing_Rate.rate_end_date OR Billing_Rate.rate_end_date IS NULL)
	AND Project.billable_type_id=#attributes.billable_type_id#
	AND Project.project_id=#attributes.project_id#
GROUP BY Hours_ID.project_id, Project.billable_type_id, Hours_ID.hours, 
	Billing_Rate.rate, Hours_ID.emp_id, Emp_Contact.name, 
	Emp_Contact.lname, Demographics.pin, Project.project_code, 
	Project.description
ORDER BY Emp_Contact.lname, Emp_Contact.name
</cfquery>
</cfsilent>

