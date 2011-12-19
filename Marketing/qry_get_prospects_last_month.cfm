
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

