<!--Reports/qry_get_monthly_hours.cfm
	Author: Jeromy F -->
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
<cfparam name="variables.non_billable_ind" default="False">
<cfquery name="get_monthly_hours" datasource="#application.datasources.main#">
SELECT Demographics.first_name, Demographics.last_name, Project.project_code AS clientcode,
	CASE
		WHEN Customer.description!=Project.description
	<cfif session.workstream_project_list_order EQ 2>
			THEN (Project.project_code || '-' || Customer.description || '-' || Project.description)
		ELSE (Project.project_code || '-' || Project.description)
	<cfelse>
			THEN (Customer.description || '-' || Project.description || ' (' ||  Project.project_code || ')')
		ELSE (Project.description || ' (' ||  Project.project_code || ')')
	</cfif>END AS clientname, REF_Employee_Classification.employee_classification,
	SUM(Time_Entry.hours) AS hours, Link_Company_User_Account.company_id
FROM Demographics
	INNER JOIN Time_Entry ON Demographics.user_account_id=Time_Entry.user_account_id
		AND Time_Entry.active_ind=1
		AND Time_Entry.work_date BETWEEN #createodbcdate(attributes.from_date)# AND #createodbcdate(attributes.through_date)#
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
		AND Project.billable_type_id<cfif NOT variables.non_billable_ind>!</cfif>=2
	INNER JOIN Employee ON Time_Entry.user_account_id=Employee.user_account_id
		AND Time_Entry.work_date BETWEEN Employee.hire_date AND COALESCE(Employee.turnover_date, Time_Entry.work_date)
		AND Employee.hire_date <= #createodbcdate(attributes.through_date)#
		AND COALESCE(Employee.turnover_date, #createodbcdate(attributes.from_date)#) >= #createodbcdate(attributes.from_date)#
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
		AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
	LEFT OUTER JOIN REF_Employee_Classification ON Employee.employee_classification_id=REF_Employee_Classification.employee_classification_id
GROUP BY Demographics.first_name, Demographics.last_name,
	CASE
		WHEN Customer.description!=Project.description
		<cfif session.workstream_project_list_order EQ 2>
			THEN (Project.project_code || '-' || Customer.description || '-' || Project.description)
		ELSE (Project.project_code || '-' || Project.description)
		<cfelse>
			THEN (Customer.description || '-' || Project.description || ' (' ||  Project.project_code || ')')
		ELSE (Project.description || ' (' ||  Project.project_code || ')')
	</cfif>END, Project.project_code,
	REF_Employee_Classification.employee_classification, Link_Company_User_Account.company_id
ORDER BY Employee.employee_classification, clientname, Demographics.last_name, Demographics.first_name
</cfquery>
</cfsilent>

