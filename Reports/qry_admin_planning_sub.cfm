
<!--Reports/qry_admin_planning_sub.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the data used in the admin_planning report breakdown of individual member performance.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="admin_planning_sub" datasource="#application.datasources.main#">
SELECT Demographics.user_account_id, Demographics.last_name, Demographics.first_name, Admin_Planning_Percent.admin_hours, Admin_Planning_Percent.admin_planning_percent
FROM Demographics,
	(SELECT Admin_Hours.user_account_id, COALESCE(Admin_Hours.admin_hours,0) AS admin_hours, COALESCE(((Admin_Hours.admin_hours/Ttl_hours.ttl_hours)*100),0) AS admin_planning_percent
	FROM
		(SELECT Demographics.user_account_id, COALESCE(SUM(hours),0) AS admin_hours
		FROM Time_Entry, Demographics
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.user_account_id=*Demographics.user_account_id
			AND Demographics.user_account_id IN (#valuelist(get_subordinates.user_account_id)#)
			AND Time_Entry.project_id=1112
			AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.admin_month#
			AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.admin_year#
		GROUP BY Demographics.user_account_id)
	AS Admin_Hours,
		(SELECT Demographics.user_account_id, SUM(hours) AS ttl_hours
		FROM Time_Entry, Demographics
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.user_account_id=*Demographics.user_account_id
			AND Demographics.user_account_id IN (#valuelist(get_subordinates.user_account_id)#)
			AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.admin_month#
			AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.admin_year#
		GROUP BY Demographics.user_account_id)
	AS Ttl_hours
	WHERE Admin_Hours.user_account_id=Ttl_Hours.user_account_id)
AS Admin_Planning_Percent
WHERE Demographics.user_account_id=Admin_Planning_Percent.user_account_id
ORDER BY Demographics.last_name, Demographics.first_name, Demographics.user_account_id
</cfquery>
</cfsilent>
