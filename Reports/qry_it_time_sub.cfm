
<!--Reports/qry_it_time_sub.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the data used in the it_time report breakdown of individual member performance.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="it_time_sub" datasource="#application.datasources.main#">
SELECT Demographics.user_account_id, Demographics.last_name, Demographics.first_name, IT_Percent.it_hours, IT_Percent.it_time_percent
FROM Demographics,
	(SELECT IT_Hours.user_account_id, COALESCE(IT_Hours.it_hours,0) AS it_hours, COALESCE(((IT_Hours.it_hours/Ttl_hours.ttl_hours)*100),0) AS it_time_percent
	FROM
		(SELECT Demographics.user_account_id, COALESCE(SUM(hours),0) AS it_hours
		FROM Time_Entry, Demographics
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.user_account_id=*Demographics.user_account_id
			AND Demographics.user_account_id IN (#valuelist(get_subordinates.user_account_id)#)
			AND Time_Entry.project_id=1113
			AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.admin_month#
			AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.admin_year#
		GROUP BY Demographics.user_account_id)
	AS IT_Hours,
		(SELECT Demographics.user_account_id, SUM(hours) AS ttl_hours
		FROM Time_Entry, Demographics
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.user_account_id=*Demographics.user_account_id
			AND Demographics.user_account_id IN (#valuelist(get_subordinates.user_account_id)#)
			AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.admin_month#
			AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.admin_year#
		GROUP BY Demographics.user_account_id)
	AS Ttl_hours
	WHERE IT_Hours.user_account_id=Ttl_Hours.user_account_id)
AS IT_Percent
WHERE Demographics.user_account_id=IT_Percent.user_account_id
ORDER BY Demographics.last_name, Demographics.first_name, Demographics.user_account_id
</cfquery>
</cfsilent>
