
<!--Reports/qry_it_time_main.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the data used in the it_time report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="it_time_main" datasource="#application.datasources.main#">
SELECT COALESCE(AP_Time.ap_time,0) AS ap_time, Ttl_Time.ttl_time, COALESCE((AP_Time.ap_time/Ttl_Time.ttl_time),0)*100.000 AS ap_percent, 
	Ttl_Time.time_year, Ttl_Time.time_month
FROM
	(SELECT SUM(hours) AS ap_time, EXTRACT(MONTH FROM date) AS time_month, EXTRACT(YEAR FROM date) AS time_year
	FROM Time_Entry
	WHERE Time_Entry.active_ind=1
		AND Time_Entry.project_id=1113
		AND emp_id IN (#valuelist(get_subordinates.emp_id)#)
	GROUP BY EXTRACT(MONTH FROM date), EXTRACT(YEAR FROM date))
AS AP_Time,
	(SELECT SUM(hours) AS ttl_time, EXTRACT(MONTH FROM date) AS time_month, EXTRACT(YEAR FROM date) AS time_year
	FROM Time_Entry
	WHERE Time_Entry.active_ind=1
		AND emp_id IN (#valuelist(get_subordinates.emp_id)#)
	GROUP BY EXTRACT(MONTH FROM date), EXTRACT(YEAR FROM date))
AS Ttl_Time
WHERE AP_Time.time_month=*Ttl_Time.time_month
	AND AP_Time.time_year=*Ttl_Time.time_year
ORDER BY Ttl_Time.time_year DESC, Ttl_Time.time_month DESC
<!--- SELECT COALESCE(SUM(it_time_time),0) AS it_time_time, time_month, time_year
FROM
(
<cfinclude template="sql_it_time_core.cfm">
) AS Raw_Data
GROUP BY time_year, time_month
ORDER BY time_year DESC, time_month DESC --->
</cfquery>
</cfsilent>
