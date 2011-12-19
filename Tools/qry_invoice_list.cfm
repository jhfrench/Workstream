
<!--Tools/qry_invoice_list.cfm
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
<cfparam name="run_post" default="0">
<cfquery name="invoice_list" datasource="#application.datasources.main#">
SELECT Customer.root_code, Project.project_code, Customer.description AS customers_name,
	Project.description AS project_name, Project.project_id, REF_Billable.billable_type,
	More_GD_Details.bill AS bill, More_GD_Details.total_tasks AS total_tasks, REF_Billable.billable_type_id
FROM Project, Customer, REF_Billable,
	(SELECT COUNT(Task.task_id) AS total_tasks, Invoice_Details.project_id, Invoice_Details.bill AS bill
	FROM Task,
		(SELECT Project_Bill.project_id, SUM(Project_Bill.bill) AS bill
		FROM Project,
			(SELECT Hours_ID.project_id,
				SUM((Hours_ID.hours*ISNULL(Billing_Rate.rate,0))) AS bill, Project.billable_type_id AS billable_type_id
			FROM Project, Billing_Rate, (
					SELECT SUM(Time_Entry.hours) AS hours, Time_Entry.project_id, Time_Entry.emp_id
					FROM Time_Entry, Link_Company_Emp_Contact
					WHERE Time_Entry.emp_id=Link_Company_Emp_Contact.emp_id
						AND DATEPART(m, Time_Entry.date)=#attributes.month#
						AND DATEPART(yyyy, Time_Entry.date)=#attributes.year#
						AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
					GROUP BY project_id, Time_Entry.emp_id
				) AS Hours_ID
			WHERE Project.project_id=Hours_ID.project_id
				AND Billing_Rate.emp_id=Hours_ID.emp_id
				AND Project.project_id=Billing_Rate.project_id
				AND ('#attributes.month#/1/#attributes.year#' BETWEEN Billing_Rate.rate_start_date AND Billing_Rate.rate_end_date OR Billing_Rate.rate_end_date IS NULL)
				AND Project.billable_type_id=1
			GROUP BY Hours_ID.project_id, Project.billable_type_id
			UNION ALL
			SELECT Project.project_id, (Flat_Rate.budget/Flat_Rate.months) AS bill, 
				Project.billable_type_id AS billable_type_id
			FROM Project, Flat_Rate
			WHERE Project.project_id=Flat_Rate.project_id
				AND Project.billable_type_id=3
				AND Project.company_id IN (#session.workstream_selected_company_id#)
				AND ((#attributes.month# = DATEPART(m,Flat_Rate.rate_start_date) AND #attributes.year# = DATEPART(yyyy,Flat_Rate.rate_start_date))
				OR ('#attributes.month#/1/#attributes.year#' <= DATEADD(m,Flat_Rate.months-1,Flat_Rate.rate_start_date)
					AND '#attributes.month#/#DaysInMonth(CreateDate(attributes.year, attributes.month, 1))#/#attributes.year#' >= Flat_Rate.rate_start_date
				))
			UNION ALL
			SELECT Project.project_id, (COUNT(Task.task_id)*Incident_Rate.charge) AS bill, Project.billable_type_id
			FROM Task, Project, Incident_Rate
			WHERE Project.project_id=Task.project_id
				AND Project.project_id=Incident_Rate.project_id
				AND Project.company_id IN (#session.workstream_selected_company_id#)
				AND MONTH(Task.entry_date)=#attributes.month#
				AND YEAR(Task.entry_date)=#attributes.year#
				AND Project.billable_type_id=4
			GROUP BY Project.project_id, Project.billable_type_id, Incident_Rate.charge
			)
		AS Project_Bill
		WHERE Project_Bill.project_id=Project.project_id
		GROUP BY Project_Bill.project_id)
	AS Invoice_Details
	WHERE Invoice_Details.project_id*=Task.project_id
		AND (Task.status_id!=11 OR ('#attributes.month#/1/#attributes.year#' BETWEEN Task.assigned_date AND Task.complete_date))
	GROUP BY Invoice_Details.project_id, Invoice_Details.bill)
AS More_GD_Details
WHERE More_GD_Details.project_id=Project.project_id
	AND Project.customer_id=Customer.customer_id
	AND Project.billable_type_id=REF_Billable.billable_type_id
ORDER BY Customer.root_code, Project.project_code
</cfquery>
</cfsilent>

