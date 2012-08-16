
<!--Marketing/qry_get_prospects_last_month.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query to get all the marketing information for the marketing module 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfquery name="prospects" datasource="#application.datasources.main#">
SELECT COUNT(Project_ID) AS prospects, EXTRACT(MONTH FROM DATEADD(m,-1,CURRENT_TIMESTAMP)) AS nice_month
FROM Project
WHERE EXTRACT(MONTH FROM created_date) = EXTRACT(MONTH FROM DATEADD(m,-1,CURRENT_TIMESTAMP))
	AND EXTRACT(YEAR FROM created_date) = EXTRACT(YEAR FROM DATEADD(m,-1,CURRENT_TIMESTAMP))
	AND root_code = 6005
</cfquery>
<cfquery name="prospects_this_month" datasource="#application.datasources.main#">
SELECT COUNT(Project_ID) AS prospects_this_month, EXTRACT(MONTH FROM DATEADD(m,0,CURRENT_TIMESTAMP)) AS nice_month
FROM Project
WHERE EXTRACT(MONTH FROM created_date) = EXTRACT(MONTH FROM DATEADD(m,0,CURRENT_TIMESTAMP))
	AND EXTRACT(YEAR FROM created_date) = EXTRACT(YEAR FROM DATEADD(m,0,CURRENT_TIMESTAMP))
	AND root_code = 6005
</cfquery>
</cfsilent>

