
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
Revision 1.0  2005/02/15 20:51:19  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:41-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 (AS|8/27/01) ; Marketing has changed their mind about what they want here. So I have re-done the query. PLEASE BE AWARE, I HAVE MOVED MOST (ALL) OF THE QUERY LOGIC INTO VIEWS IN SQL SERVER. IF YOU HAVE A QUERY CHANGE TO MAKE, TAKE A LOOK AT THE VIEWS.... (JF | 8/29/1) Rewrote query to pull information most efficiently.
	||
	Variables:
	-->sortby1: a variable set so the grid can be filtered by the columns
	-->sortby2: a variable set so the grid can be filtered by the columns
	-->sortby3: a variable set so the grid can be filtered by the columns
	END FUSEDOC --->

<!--- ADAM, Is this what you were trying to do?
			-The code fairy... 
	 I LEFT MY TOOTH HERE, NOW WHERE's MY QUARTER?????
			--->
<cfquery name="prospects" datasource="#application.datasources.main#">
SELECT COUNT(Project_ID) AS prospects, MONTH(DATEADD(m,-1,GETDATE())) AS nice_month
FROM Project
WHERE MONTH(Date_Entered) = MONTH(DATEADD(m,-1,GETDATE()))
	AND YEAR(Date_Entered) = YEAR(DATEADD(m,-1,GETDATE())) and Root_code = 6005
<!--- Select Count(Project_ID) as Prospects,(cast(datepart(month,Prospecting_Begin) as varchar(2))) as Nice_Month
From Marketing_For_Web_Query
Where DatePart(Month,Prospecting_Begin) = (DateDiff(month,{fn now()},-1))
Group by (cast(datepart(mm,Prospecting_Begin) as varchar(2))) --->
</cfquery>
<cfquery name="prospects_this_month" datasource="#application.datasources.main#">
SELECT COUNT(Project_ID) AS prospects_this_month, MONTH(DATEADD(m,0,GETDATE())) AS nice_month
FROM Project
WHERE MONTH(Date_Entered) = MONTH(DATEADD(m,0,GETDATE()))
	AND YEAR(Date_Entered) = YEAR(DATEADD(m,0,GETDATE())) and Root_code = 6005
<!--- Select Count(Project_ID) as Prospects,(cast(datepart(month,Prospecting_Begin) as varchar(2))) as Nice_Month
From Marketing_For_Web_Query
Where DatePart(Month,Prospecting_Begin) = (DateDiff(month,{fn now()},-1))
Group by (cast(datepart(mm,Prospecting_Begin) as varchar(2))) --->
</cfquery>
</cfsilent>

