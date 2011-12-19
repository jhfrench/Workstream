
<!--Marketing/qry_get_marketing_line.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query to get all the marketing information for the marketing module 

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:51:18  daugherty
	Initial revision

	Revision 1.2  2001-11-30 11:59:09-05  french
	Fixing report access error and de-stetzering..

	Revision 1.1  2001-10-11 10:55:42-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	(KL | 7/30/01): added the casting logic to the query so that the dates would display in a more readable fashion for the users of the marketing grid; (KL|8/8/01) ; updated query to pull the proper task information; (AS|8/27/01) Marketing has changed their mind about what they want here. So I have re-done the query. PLEASE BE AWARE, I HAVE MOVED MOST (ALL) OF THE QUERY LOGIC INTO VIEWS IN SQL SERVER. IF YOU HAVE A QUERY CHANGE TO MAKE, TAKE A LOOK AT THE VIEWS....
	||
	Variables
	-->sortby1: a variable set so the grid can be filtered by the columns
	-->sortby2: a variable set so the grid can be filtered by the columns
	-->sortby3: a variable set so the grid can be filtered by the columns
	END FUSEDOC --->
<cfquery name="get_marketing_line" datasource="#application.datasources.main#">
SELECT *<!--- ,(CAST(Month as varchar(4))+'/'+ CAST(Year as varchar(4))) AS nice_date --->
FROM Marketing_Date_For_Web
WHERE year > 1999
	AND year <= YEAR(GETDATE()) 
ORDER BY year, month
</cfquery>
</cfsilent>

