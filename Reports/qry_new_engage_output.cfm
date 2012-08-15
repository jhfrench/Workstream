
<!--Reports/qry_new_engage_output.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the .
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_first_elligible" datasource="#application.datasources.main#">
SELECT MIN(Project.created_date) AS first_elligible
FROM Customer
	INNER JOIN Project ON Customer.customer_id=Project.customer_id
WHERE Project.customer_id IS NOT NULL
	AND Customer.root_code IN (<cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.root_code#" list="yes" />)
</cfquery>
<cfif len(get_first_elligible.first_elligible)>
	<cfset temp_date=createodbcdatetime(createdate(year(get_first_elligible.first_elligible),month(get_first_elligible.first_elligible),1))>
</cfif>
<cfquery name="new_engage_output" datasource="#application.datasources.main#">
SELECT COALESCE(Project_By_Month.root_code,'0') AS root_code, COALESCE(Project_By_Month.customer_name,'NO NEW ENGAGEMENTS') AS customer_name, ABCD.Month AS month_entered,
	ABCD.year AS year_entered, COALESCE(Project_By_Month.engagement_count,0) AS engagement_count
FROM
	(
		SELECT date_month AS month, date_year AS year,
			MIN(odbc_date) AS start, MAX(odbc_date) AS end
		FROM REF_Date
		WHERE odbc_date <= CURRENT_TIMESTAMP<cfif len(get_first_elligible.first_elligible)>
			AND odbc_date >= #temp_date#</cfif>
		GROUP BY date_month, date_year
	) AS ABCD
	LEFT OUTER JOIN (
		SELECT Customer.root_code AS root_code, Customer.description AS customer_name, COUNT(Project.project_id) AS engagement_count, 
			EXTRACT(MONTH FROM Project.created_date) AS month_entered, EXTRACT(YEAR FROM Project.created_date) AS year_entered
		FROM Customer
			INNER JOIN Project ON Customer.customer_id=Project.customer_id
		WHERE Project.customer_id IS NOT NULL
			AND Customer.root_code IN (<cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.root_code#" list="yes" />)
		GROUP BY EXTRACT(YEAR FROM Project.created_date), EXTRACT(MONTH FROM Project.created_date), Customer.description, Customer.root_code
	) AS Project_By_Month ON ABCD.month=Project_By_Month.month_entered
		AND ABCD.year=Project_By_Month.year_entered
ORDER BY ABCD.year DESC, ABCD.month DESC, Project_By_Month.customer_name
</cfquery>
<cfquery name="selected_companies" datasource="#application.datasources.main#">
SELECT Customer.description AS customer_name
FROM Customer
WHERE Customer.root_code IN (<cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.root_code#" list="yes" />)
ORDER BY Customer.description
</cfquery>
</cfsilent>
