
<!--Marketing/qry_get_prospects_last_month.cfm
	Author: Jeromy F  -->
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
SELECT COUNT(Project_ID) AS prospects, MONTH(DATEADD(m,-1,GETDATE())) AS nice_month
FROM Project
WHERE MONTH(created_date) = MONTH(DATEADD(m,-1,GETDATE()))
	AND YEAR(created_date) = YEAR(DATEADD(m,-1,GETDATE()))
	AND root_code = 6005
</cfquery>
<cfquery name="prospects_this_month" datasource="#application.datasources.main#">
SELECT COUNT(Project_ID) AS prospects_this_month, MONTH(DATEADD(m,0,GETDATE())) AS nice_month
FROM Project
WHERE MONTH(created_date) = MONTH(DATEADD(m,0,GETDATE()))
	AND YEAR(created_date) = YEAR(DATEADD(m,0,GETDATE()))
	AND root_code = 6005
</cfquery>
</cfsilent>

