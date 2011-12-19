
<!--Marketing/qry_get_marketing_data.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query to get all the marketing information for the marketing module 

	||
	Edits:
	$Log$
	||
	Variables:- ->sortby1: a variable set so the grid can be filtered by the columns
		- ->sortby2: a variable set so the grid can be filtered by the columns
		- ->sortby3: a variable set so the grid can be filtered by the columns
	END FUSEDOC --->


<cfquery name="marketing_duration" datasource="#application.datasources.main#">
SELECT AVG(DATEDIFF(D, Prospecting_Begin, Prospecting_End)) 
    AS Prospecting_Dur, AVG(DATEDIFF(D, Qualifying_Begin, 
    Qualifying_End)) AS Qualifying_Dur, AVG(DATEDIFF(D, 
    Proposing_Begin, Proposing_End)) AS Proposing_Dur, 
    AVG(DATEDIFF(D, Closing_Begin, Closing_End)) 
    AS Closing_Dur
FROM Marketing_For_Web_Query
</cfquery>

</cfsilent>



