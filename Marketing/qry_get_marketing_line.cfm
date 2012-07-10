
<!--Marketing/qry_get_marketing_line.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query to get all the marketing information for the marketing module 

	||
	Edits:
	$Log$
	||
	Variables
	-->sortby1: a variable set so the grid can be filtered by the columns
	-->sortby2: a variable set so the grid can be filtered by the columns
	-->sortby3: a variable set so the grid can be filtered by the columns
	END FUSEDOC --->
<cfquery name="get_marketing_line" datasource="#application.datasources.main#">
SELECT *
FROM Marketing_Date_For_Web
WHERE year > 1999
	AND year <= EXTRACT(YEAR FROM CURRENT_TIMESTAMP) 
ORDER BY year, month
</cfquery>
</cfsilent>

