
<!--Timekeeping/qry_hours_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the hours an employee worked in the last two months.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> session.user_account_id: number that uniquely identifies the user
 --->
<cfset variables.temp_date=dateadd("m",-1,now())>
<cfset variables.previous_month=CreateODBCDate("#month(variables.temp_date)#/1/#year(variables.temp_date)#")>
<cfset variables.current_month=CreateODBCDate("#month(now())#/#daysinmonth(now())#/#year(now())#")>
<cfquery name="hours_blurb" datasource="#application.datasources.main#">
SELECT SUM(hours) AS month_hours, DATEPART(YYYY,date) AS work_year, DATEPART(M,date) AS work_month
FROM Time_Entry
WHERE Time_Entry.emp_id=#session.user_account_id#
	AND Time_Entry.date BETWEEN #variables.previous_month# AND #variables.current_month#
GROUP BY DATEPART(YYYY,date), DATEPART(M,date)
ORDER BY DATEPART(YYYY,date), DATEPART(M,date)
</cfquery>
</cfsilent>

