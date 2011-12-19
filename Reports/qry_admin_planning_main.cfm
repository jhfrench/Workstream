
<!--Reports/qry_admin_planning_main.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the data used in the admin_planning report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:12:39  stetzer
	<>

	Revision 1.0  2001-11-05 18:00:11-05  french
	Initial file creation and coding.

	||
	END FUSEDOC --->
<cfquery name="admin_planning_main" datasource="#application.datasources.main#">
SELECT ISNULL(AP_Time.ap_time,0) AS ap_time, Ttl_Time.ttl_time, ISNULL((AP_Time.ap_time/Ttl_Time.ttl_time),0)*100.000 AS ap_percent, 
	Ttl_Time.time_year, Ttl_Time.time_month
FROM
	(SELECT SUM(hours) AS ap_time, MONTH(date) AS time_month, YEAR(date) AS time_year
	FROM Time_Entry
	WHERE Time_Entry.project_id=1112
		AND emp_id IN (#valuelist(get_subordinates.emp_id)#)
	GROUP BY MONTH(date), YEAR(date))
AS AP_Time,
	(SELECT SUM(hours) AS ttl_time, MONTH(date) AS time_month, YEAR(date) AS time_year
	FROM Time_Entry
	WHERE emp_id IN (#valuelist(get_subordinates.emp_id)#)
	GROUP BY MONTH(date), YEAR(date))
AS Ttl_Time
WHERE AP_Time.time_month=*Ttl_Time.time_month
	AND AP_Time.time_year=*Ttl_Time.time_year
ORDER BY Ttl_Time.time_year DESC, Ttl_Time.time_month DESC
<!--- SELECT ISNULL(SUM(admin_planning_time),0) AS admin_planning_time, time_month, time_year
FROM
(
<cfinclude template="sql_admin_planning_core.cfm">
) AS Raw_Data
GROUP BY time_year, time_month
ORDER BY time_year DESC, time_month DESC --->
</cfquery>
</cfsilent>
