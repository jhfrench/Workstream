
<!--Marketing/qry_get_marketing_data.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query to get all the marketing information for the marketing module 

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:51:16  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:43-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 (KL | 7/30/01): added the casting logic to the query so that the dates would display in a more readable fashion for the users of the marketing grid.
(KL|8/8/01) ; updated query to pull the proper task information. (AS|8/27/01) ; Marketing has changed their mind about what they want here. So I have re-done the query. PLEASE BE AWARE, I HAVE MOVED MOST (ALL) OF THE QUERY LOGIC INTO VIEWS IN SQL SERVER. IF YOU HAVE A QUERY CHANGE TO MAKE, TAKE A LOOK AT THE VIEWS....
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



