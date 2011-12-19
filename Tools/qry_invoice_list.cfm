
<!--Tools/qry_invoice_list.cfm
	Author: Jeromy F  -->
	
	
<cfparam name="run_post" default="0">

<cfif run_post contains '1'>


<cflocation url="../../monitor/Invoice_Post.cfm">
<!--- <cfinclude template="../../monitor/Invoice_Post.cfm"> --->

</cfif>
	
	
	
	
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
<cfquery name="invoice_list" datasource="#application.datasources.main#">
SELECT Customers.root_code, Project.project_code, 
	Customers.description AS customers_name, Project.description AS project_name, 
	Project.project_id, REF_Billable.billable_type, More_GD_Details.bill AS bill, More_GD_Details.total_tasks AS total_tasks, REF_Billable.billable_id
FROM Project, Customers, REF_Billable,
	(SELECT COUNT(Task.task_id) AS total_tasks, Invoice_Details.project_id AS project_id, Invoice_Details.bill AS bill
	FROM Task,
		(SELECT Project_Bill.project_id AS project_id, SUM(Project_Bill.bill) AS bill
		FROM Project,
			(SELECT Hours_ID.project_id AS project_id,
				SUM((Hours_ID.hours*ISNULL(Billing_Rate.rate,0))) AS bill, Project.billable_id AS billable_id
			FROM Project, Billing_Rate, 
				(SELECT SUM(Time_Entry.hours) AS hours, Time_Entry.project_id AS project_id, Time_Entry.emp_id
				FROM Time_Entry, Company
				WHERE Time_Entry.emp_id=Company.emp_id
					AND DATEPART(m, Time_Entry.date)=#attributes.month#
					AND DATEPART(yyyy, Time_Entry.date)=#attributes.year#
					AND Company.company IN (#session.workstream_company_select_list#)
				GROUP BY project_id, Time_Entry.emp_id)
			AS Hours_ID
			WHERE Project.project_id=Hours_ID.project_id
				AND Billing_Rate.emp_id=Hours_ID.emp_id
				AND Project.project_id=Billing_Rate.project_id
				AND ('#attributes.month#/1/#attributes.year#' BETWEEN Billing_Rate.rates_good_from AND Billing_Rate.rates_good_to OR Billing_Rate.rates_good_to IS NULL)
				AND Project.billable_id=1
			GROUP BY Hours_ID.project_id, Project.billable_id
			UNION ALL
			SELECT Project.project_id, (Flat_Rate.budget/Flat_Rate.months) AS bill, 
				Project.billable_id AS billable_id
			FROM Project, Flat_Rate
			WHERE Project.project_id=Flat_Rate.project_id
				AND Project.billable_id=3
				AND Project.company_id IN (#session.workstream_company_select_list#)
				AND ((#attributes.month# = DATEPART(m,Flat_Rate.start_date) AND #attributes.year# = DATEPART(yyyy,Flat_Rate.start_date))
				OR ('#attributes.month#/1/#attributes.year#' <= DATEADD(m,Flat_Rate.months-1,Flat_Rate.start_date)
					AND '#attributes.month#/#DaysInMonth(CreateDate(attributes.year, attributes.month, 1))#/#attributes.year#' >= Flat_Rate.start_date
				))
			UNION ALL
			SELECT Project.project_id, (COUNT(Task.task_id)*Incident_Rate.charge) AS bill, Project.billable_id AS billable_id
			FROM Task, Project, Incident_Rate
			WHERE Project.project_id=Task.project_id
				AND Project.project_id=Incident_Rate.project_id
				AND Project.company_id IN (#session.workstream_company_select_list#)
				AND MONTH(Task.entry_date)=#attributes.month#
				AND YEAR(Task.entry_date)=#attributes.year#
				AND Project.billable_id=4
			GROUP BY Project.project_id, Project.billable_id, Incident_Rate.charge
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
	AND Project.customers_id=Customers.customers_id
	AND Project.billable_id=REF_Billable.billable_id
ORDER BY Customers.root_code, Project.project_code
</cfquery>



</cfsilent>

