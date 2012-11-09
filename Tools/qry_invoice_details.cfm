
<!--Tools/qry_invoice_details.cfm
	Author: Jeromy F -->
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
	(Hours_ID.hours*COALESCE(Billing_Rate.rate,0)) AS bill, Hours_ID.user_account_id, (Demographics.last_name || ', ' || Demographics.first_name) AS name, 
	Project.project_code, Project.description AS project_name
FROM (
		SELECT SUM(Time_Entry.hours) AS hours, Time_Entry.project_id, Time_Entry.user_account_id
		FROM Time_Entry
			INNER JOIN Link_Company_User_Account ON Time_Entry.user_account_id=Link_Company_User_Account.user_account_id
				AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
		WHERE Time_Entry.active_ind=1
			AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.month#
			AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.year#
		GROUP BY Time_Entry.project_id, Time_Entry.user_account_id
	) AS Hours_ID
	INNER JOIN Project ON Hours_ID.project_id=Project.project_id
	INNER JOIN Demographics ON Hours_ID.user_account_id=Demographics.user_account_id
		AND Demographic.active_ind=1
	LEFT OUTER JOIN Billing_Rate ON Hours_ID.user_account_id=Billing_Rate.user_account_id
		AND Project.project_id=Billing_Rate.project_id
		AND ('#attributes.month#/1/#attributes.year#' BETWEEN Billing_Rate.rate_start_date AND Billing_Rate.rate_end_date OR Billing_Rate.rate_end_date IS NULL)
WHERE Project.billable_type_id=#attributes.billable_type_id#
	AND Project.project_id=#attributes.project_id#
GROUP BY Hours_ID.project_id, Project.billable_type_id, Hours_ID.hours, 
	Billing_Rate.rate, Hours_ID.user_account_id, Demographics.first_name, 
	Demographics.last_name, Project.project_code, Project.description
ORDER BY Demographics.last_name, Emp_Contact.name
</cfquery>
</cfsilent>