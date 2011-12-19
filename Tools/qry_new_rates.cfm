
<!--Tools/qry_new_rates.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the queries that are used to drive the customer rates grid.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery  datasource="#application.datasources.main#" >
INSERT INTO Billing_Rate (project_id, emp_id, rate)
SELECT Time_entry.project_id, Time_entry.emp_id, Billing_Rate.rate 
FROM Time_entry
	LEFT OUTER JOIN  billing_rate ON Time_entry.emp_id = Billing_Rate.emp_id
		AND Time_entry.project_id = Billing_Rate.project_id
WHERE Billing_Rate.billing_rate_id IS NULL
GROUP BY time_entry.emp_id, Time_entry.project_id,  Billing_Rate.rate
HAVING (Billing_Rate.rate IS NULL )
</cfquery>

<cfquery NAME="new_rates" datasource="#application.datasources.main#">
SELECT Project.Description, Emp_Contact.Name, Emp_Contact.LName,
	Billing_Rate.Rate, Billing_Rate.emp_id, Billing_Rate.project_id,
	Billing_Rate.Billing_Rate_ID, Billing_Rate.rates_good_from,Billing_Rate.rates_good_to
FROM Billing_Rate
	INNER JOIN Project ON Billing_Rate.project_id = Project.project_id
	INNER JOIN Emp_Contact ON Billing_Rate.emp_id = Emp_Contact.emp_id
	INNER JOIN Company ON Emp_Contact.emp_id = Company.emp_id
WHERE Billing_Rate.Rate IS NULL
	AND Project.billable_type_id = 1
    AND Company.company IN (#session.workstream_company_select_list#)
ORDER BY name
</cfquery>
</cfsilent>
