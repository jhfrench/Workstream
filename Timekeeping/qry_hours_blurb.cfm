
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
	Revision 1.1  2005/03/09 18:26:34  stetzer
	<>

	Revision 1.4  2002-01-02 17:33:32-05  french
	Renamed a variable that was interfering with the display.

	Revision 1.3  2002-01-02 15:59:17-05  french
	Correcting WHERE statement in the hours queries so that divide by zero doesn't occur in January. Re-instituting hours blurbs.

	Revision 1.2  2001-10-31 11:26:22-05  french
	Made adjustment to where statement that will keep the query from retrieving any time entries that are entered for the next month (these entries are coming from the workstream Outlook form, but could also come from dates being adjusted on the notes edit form).

	Revision 1.1  2001-10-11 10:54:41-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
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

