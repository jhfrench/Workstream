
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
	(Hours_ID.hours*COALESCE(Billing_Rate.rate,0)) AS bill, Hours_ID.emp_id, (Emp_Contact.lname || ', ' || Emp_Contact.name) AS name, 
	Demographics.pin, Project.project_code, Project.description AS project_name
FROM (
		SELECT SUM(Time_Entry.hours) AS hours, Time_Entry.project_id, Time_Entry.emp_id
		FROM Time_Entry
			INNER JOIN Link_Company_Emp_Contact ON Time_Entry.emp_id=Link_Company_Emp_Contact.emp_id
				AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
		WHERE EXTRACT(MONTH FROM Time_Entry.date)=#attributes.month#
			AND EXTRACT(YEAR FROM Time_Entry.date)=#attributes.year#
		GROUP BY Time_Entry.project_id, Time_Entry.emp_id
	) AS Hours_ID
	INNER JOIN Project ON Hours_ID.project_id=Project.project_id
	INNER JOIN Emp_Contact ON Hours_ID.emp_id=Emp_Contact.emp_id
	INNER JOIN Demographics_Ngauge Demographics ON Hours_ID.emp_id=Demographics.emp_id
	LEFT OUTER JOIN Billing_Rate ON Hours_ID.emp_id=Billing_Rate.emp_id
		AND Project.project_id=Billing_Rate.project_id
		AND ('#attributes.month#/1/#attributes.year#' BETWEEN Billing_Rate.rate_start_date AND Billing_Rate.rate_end_date OR Billing_Rate.rate_end_date IS NULL)
WHERE Project.billable_type_id=#attributes.billable_type_id#
	AND Project.project_id=#attributes.project_id#
GROUP BY Hours_ID.project_id, Project.billable_type_id, Hours_ID.hours, 
	Billing_Rate.rate, Hours_ID.emp_id, Emp_Contact.name, 
	Emp_Contact.lname, Demographics.pin, Project.project_code, 
	Project.description
ORDER BY Emp_Contact.lname, Emp_Contact.name
</cfquery>
</cfsilent>

