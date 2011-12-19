
<!--Reports/qry_efficiency_report_main.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the data used in the efficiency report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:12:54  stetzer
	<>

	||
	END FUSEDOC --->
<cfquery name="efficiency_report_main" datasource="#application.datasources.main#">
SELECT ISNULL(Efficiency_Time.efficiency_time,0) AS efficiency_time, Ttl_Time.ttl_time, ISNULL((Efficiency_Time.efficiency_time/Ttl_Time.ttl_time),0)*100.000 AS efficiency_percent, 
	Ttl_Time.time_year, Ttl_Time.time_month
FROM
	(SELECT SUM(hours) AS efficiency_time, MONTH(date) AS time_month, YEAR(date) AS time_year
	FROM Time_Entry
	WHERE Time_Entry.project_id=#variables.project_id#
		AND emp_id IN (#valuelist(get_subordinates.emp_id)#)
	GROUP BY MONTH(date), YEAR(date))
AS Efficiency_Time,
	(SELECT SUM(hours) AS ttl_time, MONTH(date) AS time_month, YEAR(date) AS time_year
	FROM Time_Entry
	WHERE emp_id IN (#valuelist(get_subordinates.emp_id)#)
	GROUP BY MONTH(date), YEAR(date))
AS Ttl_Time
WHERE Efficiency_Time.time_month=*Ttl_Time.time_month
	AND Efficiency_Time.time_year=*Ttl_Time.time_year
ORDER BY Ttl_Time.time_year DESC, Ttl_Time.time_month DESC
</cfquery>
</cfsilent>
