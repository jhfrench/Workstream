
<!--Reports/qry_code_report.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="#query#" datasource="#application.datasources.main#">
SELECT Demographics.first_name, Demographics.last_name, 
	Project.project_code AS clientcode, 
	Project.description AS clientname, 
	REF_Employee_Classification.employee_classification,
	<cfif isdefined("variables.month_loop")><cfloop from="1" to="#variables.month_loop#" index="ii"><cfset variables.current_month=dateformat(dateadd("m",ii-1,variables.from_date), "mm/yyyy")>SUM(CASE WHEN EXTRACT(MONTH FROM Time_Entry.work_date)=#month(variables.current_month)# AND EXTRACT(YEAR FROM Time_Entry.work_date)=#year(variables.current_month)# THEN Time_Entry.hours ELSE 0 END) AS 'period_#ii#',
	</cfloop></cfif>SUM(Time_Entry.hours) AS hours, 
	REF_Company.description AS company
FROM Demographics 
		INNER JOIN Time_Entry ON Demographics.user_account_id=Time_Entry.user_account_id
		INNER JOIN View_Demographics_Workstream AS Demographics ON Demographics.user_account_id=Demographics.user_account_id
			AND Time_Entry.work_date BETWEEN Demographics.hire_date AND COALESCE(Demographics.effective_to, #createodbcdate(attributes.through_date)#)
		INNER JOIN Project ON Time_Entry.project_id = Project.project_id
		INNER JOIN Customer ON Project.customer_id = Customer.customer_id
		INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
		INNER JOIN REF_Company ON Link_Company_User_Account.company_id = REF_Company.company_id
		LEFT OUTER JOIN REF_Employee_Classification
			ON Demographics.employee_classification_id = REF_Employee_Classification.employee_classification_id
WHERE Time_Entry.active_ind=1
	AND Time_Entry.work_date BETWEEN #createodbcdate(attributes.from_date)# AND #createodbcdate(attributes.through_date)#
	AND Project.project_id = #project_id#
	AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
	AND Demographics.hire_date <= #createodbcdate(attributes.through_date)#
	AND COALESCE(Demographics.effective_to, #createodbcdate(attributes.from_date)#) >= #createodbcdate(attributes.from_date)#
GROUP BY Demographics.first_name, Demographics.last_name, 
	Project.description, Project.project_code, 
	REF_Employee_Classification.employee_classification, 
	REF_Company.description
ORDER BY REF_Employee_Classification.employee_classification, Project.project_code, Demographics.last_name
</cfquery>
</cfsilent>
