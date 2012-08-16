
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
SELECT AVG(prospecting_end-prospecting_begin) AS prospecting_dur, AVG(qualifying_end-qualifying_begin) AS qualifying_dur, AVG(proposing_end-proposing_begin) AS proposing_dur, 
    AVG(closing_end-closing_begin) AS Closing_Dur
FROM Marketing_For_Web_Query
</cfquery>
</cfsilent>
