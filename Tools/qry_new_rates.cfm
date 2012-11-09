
<!--Tools/qry_new_rates.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the queries that are used to drive the customer rates grid.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="insert_billing_rate" datasource="#application.datasources.main#" >
INSERT INTO Billing_Rate (project_id, user_account_id, rate)
SELECT Time_entry.project_id, Time_entry.user_account_id, Billing_Rate.rate 
FROM Time_entry
	LEFT OUTER JOIN Billing_Rate ON Time_entry.user_account_id=Billing_Rate.user_account_id
		AND Time_entry.project_id = Billing_Rate.project_id
WHERE Time_Entry.active_ind=1
	AND Billing_Rate.billing_rate_id IS NULL
GROUP BY time_entry.user_account_id, Time_entry.project_id, Billing_Rate.rate
HAVING (Billing_Rate.rate IS NULL )
</cfquery>

<cfquery name="new_rates" datasource="#application.datasources.main#">
SELECT Project.description, Emp_Contact.name, Emp_Contact.lname,
	Billing_Rate.Rate, Billing_Rate.user_account_id, Billing_Rate.project_id,
	Billing_Rate.Billing_Rate_ID, Billing_Rate.rate_start_date,Billing_Rate.rate_end_date
FROM Billing_Rate
	INNER JOIN Project ON Billing_Rate.project_id = Project.project_id
	INNER JOIN Emp_Contact ON Billing_Rate.user_account_id=Emp_Contact.user_account_id
	INNER JOIN Link_Company_User_Account ON Emp_Contact.user_account_id=Link_Company_User_Account.user_account_id
WHERE Billing_Rate.Rate IS NULL
	AND Project.billable_type_id = 1
	AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
ORDER BY name
</cfquery>
</cfsilent>
