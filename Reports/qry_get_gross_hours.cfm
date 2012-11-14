
<!--Reports/qry_get_gross_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the gross hours report.
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_gross_hours" datasource="#application.datasources.main#">
SELECT (Demographics.last_name || ', ' || Demographics.first_name) AS name,<cfloop from="1" to="#variables.daysinmonth#" index="ii">
	SUM(CASE WHEN EXTRACT(DAY FROM Time_Entry.work_date)=#ii# THEN Time_Entry.hours ELSE 0 END) AS day#ii#,</cfloop>
	SUM(CASE WHEN Time_Entry.work_date IS NOT NULL THEN Time_Entry.hours ELSE 0 END) AS total
FROM Demographics
	INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
		AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
	INNER JOIN View_Demographics_Workstream ON Demographics.user_account_id=View_Demographics_Workstream.user_account_id
		AND View_Demographics_Workstream.hire_date <= #variables.date_closed#
		AND COALESCE(View_Demographics_Workstream.effective_to,#variables.date_open#) >= #variables.date_open#
	LEFT OUTER JOIN Location ON Demographics.user_account_id=Location.user_account_id
		AND Location.location_type_id=1
	LEFT OUTER JOIN Time_Entry ON Demographics.user_account_id=Time_Entry.user_account_id
		AND Time_Entry.active_ind=1
		AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.work_month#
		AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.work_year#
WHERE 1=1<cfif isdefined("attributes.user_account_id") AND comparenocase(attributes.user_account_id, "ALL")>
	AND Demographics.user_account_id=#attributes.user_account_id#</cfif><cfif isdefined("attributes.office_location") AND comparenocase(attributes.office_location, "ALL")>
	AND Location.city='#attributes.office_location#'</cfif>
GROUP BY last_name, name
ORDER BY name
</cfquery>
</cfsilent>

<cfquery name="get_gross_hours_total" dbtype="query">
SELECT <cfloop from="1" to="#variables.daysinmonth#" index="ii">
	SUM(day#ii#) AS day#ii#,</cfloop>
	SUM(total) AS total
FROM get_gross_hours
</cfquery>
