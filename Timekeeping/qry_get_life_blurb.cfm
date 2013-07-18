
<!--Timekeeping/qry_life_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the hours an employee worked in the last two months.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> variables.user_identification: number that uniquely identifies the user
 --->
<cfquery name="get_life_blurb" cachedwithin="#createtimespan(30, 0, 0, 0)#" datasource="#application.datasources.main#">
SELECT SUM(CASE WHEN EXTRACT(MONTH FROM CURRENT_DATE)=EXTRACT(MONTH FROM Employee.hire_date) AND EXTRACT(YEAR FROM CURRENT_DATE) = EXTRACT(YEAR FROM Employee.hire_date) THEN 1 ELSE 0 END) AS new_hire_count,
	SUM(CASE WHEN EXTRACT(MONTH FROM CURRENT_DATE)=EXTRACT(MONTH FROM Employee.birth_date) THEN 1 ELSE 0 END) AS birthday_count,
	SUM(CASE WHEN EXTRACT(MONTH FROM CURRENT_DATE)=EXTRACT(MONTH FROM Employee.hire_date) AND EXTRACT(YEAR FROM CURRENT_DATE) > EXTRACT(YEAR FROM Employee.hire_date) THEN 1 ELSE 0 END) AS anniversary_count,
	SUM(1) AS employee_count
FROM Employee
	INNER JOIN Link_Company_User_Account ON Employee.user_account_id=Link_Company_User_Account.user_account_id
		AND Link_Company_User_Account.company_id=<cfqueryparam value="#listlast(session.workstream_company_id)#" cfsqltype="cf_sql_integer" />
WHERE Employee.active_ind=1
	AND CURRENT_DATE BETWEEN Employee.hire_date AND COALESCE(Employee.turnover_date, CURRENT_TIMESTAMP)
	AND <cfqueryparam value="#application.team_changed#" cfsqltype="cf_sql_timestamp" />=<cfqueryparam value="#application.team_changed#" cfsqltype="cf_sql_timestamp" />
	AND <cfqueryparam value="#month(now())#" cfsqltype="cf_sql_integer" />!=<cfqueryparam value="#year(now())#" cfsqltype="cf_sql_integer" />
</cfquery>
</cfsilent>
