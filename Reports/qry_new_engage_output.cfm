
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
Revision 1.1  2005/03/09 18:14:21  stetzer
<>

Revision 1.1  2001-10-11 11:03:54-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
<cfquery name="get_first_elligible" datasource="#application.datasources.main#">
SELECT MIN(Project.date_entered) AS first_elligible
FROM Customers, Project
WHERE Customers.customers_id=Project.customers_id
	AND Project.customers_id IS NOT NULL
	AND Customers.root_code IN (#attributes.root_code#)
</cfquery>
<cfif len(get_first_elligible.first_elligible)>
	<cfset temp_date=createodbcdatetime(CreateDate(Year(get_first_elligible.first_elligible),Month(get_first_elligible.first_elligible),1))>
</cfif>
<cfquery name="new_engage_output" datasource="#application.datasources.main#">
SELECT ISNULL(Engagement_By_Month.root_code,0) AS root_code, ISNULL(Engagement_By_Month.customer_name,'NO NEW ENGAGEMENTS') AS customer_name, ABCD.Month AS month_entered, ABCD.year AS year_entered, ISNULL(Engagement_By_Month.engagement_count,0) AS engagement_count
FROM ABCD_Months ABCD,
	(SELECT Customers.root_code AS root_code, Customers.description AS customer_name, COUNT(Project.project_id) AS engagement_count, 
		MONTH(Project.date_entered) AS month_entered, YEAR(Project.date_entered) AS year_entered
	FROM Customers, Project
	WHERE Customers.customers_id=Project.customers_id
		AND Project.customers_id IS NOT NULL
		AND Customers.root_code IN (#attributes.root_code#)
	GROUP BY YEAR(Project.date_entered), MONTH(Project.date_entered), Customers.description, Customers.root_code)
AS Engagement_By_Month
WHERE ABCD.month*=Engagement_By_Month.month_entered
	AND ABCD.year*=Engagement_By_Month.year_entered
	AND ABCD.start <= GETDATE()
	<cfif len(get_first_elligible.first_elligible)>AND ABCD.start >= #temp_date#</cfif>
ORDER BY ABCD.year DESC, ABCD.month DESC, Engagement_By_Month.customer_name
</cfquery>
<cfquery name="selected_companies" datasource="#application.datasources.main#">
SELECT Customers.description AS customer_name
FROM Customers
WHERE Customers.root_code IN (#attributes.root_code#)
ORDER BY Customers.description
</cfquery>
</cfsilent>
