
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
<CFQUERY  datasource="#application.datasources.main#" >
		INSERT INTO billing_rate
		(Project_id,emp_id,rate)
       SELECT Time_entry.project_id, Time_entry.emp_id, billing_rate.rate 
  
FROM Time_entry LEFT OUTER JOIN
    billing_rate ON Time_entry.emp_id = billing_rate.emp_id AND 
    Time_entry.project_id = billing_rate.project_id
where billing_rate.billing_rate_id IS NULL
GROUP BY time_entry.emp_id, Time_entry.project_id,  billing_rate.rate
HAVING (billing_rate.rate IS NULL )
</CFQUERY>

<cfquery NAME="new_rates" datasource="#application.datasources.main#">
SELECT Project.Description, Emp_Contact.Name, 
    Emp_Contact.LName, Billing_Rate.Rate, Billing_Rate.Emp_ID, 
    Billing_Rate.Project_ID, Billing_Rate.Billing_Rate_ID, Billing_Rate.rates_good_from,Billing_Rate.rates_good_to
FROM Billing_Rate INNER JOIN
    Project ON 
    Billing_Rate.Project_ID = Project.project_id INNER JOIN
    Emp_Contact ON 
    Billing_Rate.Emp_ID = Emp_Contact.Emp_ID INNER JOIN
    Company ON 
    Emp_Contact.Emp_ID = Company.Emp_ID
WHERE (Billing_Rate.Rate IS NULL) AND (Project.Billable_ID = 1) 
    AND (company.company IN(#session.workstream_company_select_list#))
ORDER BY name
</cfquery>

</cfsilent>
