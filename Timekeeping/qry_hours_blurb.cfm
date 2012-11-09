
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
	--> variables.user_identification: number that uniquely identifies the user
 --->
<cfset variables.temp_date=dateadd("m",-1,now())>
<cfset variables.previous_month=createodbcdate("#month(variables.temp_date)#/1/#year(variables.temp_date)#")>
<cfset variables.current_month=createodbcdate("#month(now())#/#daysinmonth(now())#/#year(now())#")>
<cfquery name="hours_blurb" datasource="#application.datasources.main#">
SELECT SUM(hours) AS month_hours, EXTRACT(YEAR FROM work_date) AS work_year, EXTRACT(MONTH FROM work_date) AS work_month
FROM Time_Entry
WHERE Time_Entry.active_ind=1
	AND Time_Entry.user_account_id=#variables.user_identification#
	AND Time_Entry.work_date BETWEEN #variables.previous_month# AND #variables.current_month#
GROUP BY EXTRACT(YEAR FROM work_date), EXTRACT(MONTH FROM work_date)
ORDER BY EXTRACT(YEAR FROM work_date), EXTRACT(MONTH FROM work_date)
</cfquery>
</cfsilent>

