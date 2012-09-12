
<!--Reports/qry_efficiency_report_main.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the data used in the efficiency report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="efficiency_report_main" datasource="#application.datasources.main#">
SELECT COALESCE(Efficiency_Time.efficiency_time,0) AS efficiency_time, Ttl_Time.ttl_time, COALESCE((Efficiency_Time.efficiency_time/Ttl_Time.ttl_time),0)*100.000 AS efficiency_percent, 
	Ttl_Time.time_year, Ttl_Time.time_month
FROM 
	(
		SELECT SUM(hours) AS ttl_time, EXTRACT(MONTH FROM Time_Entry.work_date) AS time_month, EXTRACT(YEAR FROM Time_Entry.work_date) AS time_year
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.emp_id IN (#valuelist(get_subordinates.emp_id)#)
		GROUP BY EXTRACT(MONTH FROM Time_Entry.work_date), EXTRACT(YEAR FROM Time_Entry.work_date)
	) AS Ttl_Time
	LEFT OUTER JOIN (
		SELECT SUM(hours) AS efficiency_time, EXTRACT(MONTH FROM Time_Entry.work_date) AS time_month, EXTRACT(YEAR FROM Time_Entry.work_date) AS time_year
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.project_id=#variables.project_id#
			AND Time_Entry.emp_id IN (#valuelist(get_subordinates.emp_id)#)
		GROUP BY EXTRACT(MONTH FROM Time_Entry.work_date), EXTRACT(YEAR FROM Time_Entry.work_date)
	) AS Efficiency_Time ON Ttl_Time.time_month=Efficiency_Time.time_month
		AND Ttl_Time.time_year=Efficiency_Time.time_year
ORDER BY Ttl_Time.time_year DESC, Ttl_Time.time_month DESC
</cfquery>
</cfsilent>
