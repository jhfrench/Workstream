
<!--Reports/qry_efficiency_report_sub.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the data used in the efficiency report breakdown of individual member performance.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

<cfquery name="efficiency_report_sub" datasource="#application.datasources.main#">
SELECT Demographics.user_account_id, Demographics.last_name, Demographics.first_name, Efficiency_Percent.efficiency_hours, Efficiency_Percent.efficiency_percent
FROM Demographics
	INNER JOIN (
		SELECT Efficiency_Hours.user_account_id, COALESCE(Efficiency_Hours.efficiency_hours,0) AS efficiency_hours, COALESCE(((Efficiency_Hours.efficiency_hours/Ttl_hours.ttl_hours)*100),0) AS efficiency_percent
		FROM (
				SELECT Demographics.user_account_id, COALESCE(SUM(hours),0) AS efficiency_hours
				FROM Demographics
					LEFT OUTER JOIN Time_Entry ON Demographics.user_account_id=Time_Entry.user_account_id
						AND Time_Entry.project_id=#variables.project_id#<!--- $issue$: rewrite this query to use COALESCE(SUM(CASE WHEN project_id=#variables.project_id# THEN hours ELSE 0),0) AS efficiency_hours--->
						AND Time_Entry.active_ind=1
						AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.admin_month#
						AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.admin_year#
				WHERE Demographics.user_account_id IN (#valuelist(get_subordinates.user_account_id)#)
				GROUP BY Demographics.user_account_id
			) AS Efficiency_Hours
			INNER JOIN (
				SELECT Demographics.user_account_id, SUM(hours) AS ttl_hours
				FROM Demographics
					LEFT OUTER JOIN Time_Entry ON Demographics.user_account_id=Time_Entry.user_account_id
						AND Time_Entry.active_ind=1
						AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.admin_month#
						AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.admin_year#
				WHERE Demographics.user_account_id IN (#valuelist(get_subordinates.user_account_id)#)
				GROUP BY Demographics.user_account_id
			) AS Ttl_hours ON Efficiency_Hours.user_account_id=Ttl_Hours.user_account_id
	) AS Efficiency_Percent ON Demographics.user_account_id=Efficiency_Percent.user_account_id
ORDER BY Demographics.last_name, Demographics.first_name, Demographics.user_account_id
</cfquery>
</cfsilent>
