
<!-- Reports/qry_get_pto_summary.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the rollup of the PTO HOURS report

	||
	Edits:
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfset variables.user_relevant_company_id=listappend(session.workstream_selected_company_id, session.workstream_company_id)>
<cfquery name="pto_hours" datasource="#application.datasources.main#">
SELECT Demographics.first_name, Demographics.last_name, Demographics.user_account_id,
	COALESCE(Hours_Taken_Table.hours_taken, 0) AS pto_used_hours,
	COALESCE(Hours_Earned.earned_hours,0) AS pto_hours_earned,
	COALESCE(Hours_Earned.earned_hours,0)-COALESCE(Hours_Taken_Table.hours_taken,0) AS remain
FROM Demographics
	LEFT OUTER JOIN (
		SELECT SUM(Time_Entry.hours) AS hours_taken, user_account_id
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.work_date >= (
					SELECT pto_start_date
					FROM REF_Company
					WHERE company_id=<cfqueryparam value="#session.workstream_company_id#" cfsqltype="cf_sql_integer" />
				)<cfif NOT listcontainsnoCase(attributes.user_account_id,"ALL" )>
			AND Time_Entry.user_account_id IN (<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" list="true" />)</cfif>
			AND Time_Entry.project_id=<cfqueryparam value="#application.application_specific_settings.pto_project_id#" cfsqltype="cf_sql_integer" />
		GROUP BY user_account_id
	) AS Hours_Taken_Table ON Demographics.user_account_id=Hours_Taken_Table.user_account_id
	LEFT OUTER JOIN (
		SELECT SUM(PTO_Grant.granted_hours) AS earned_hours, user_account_id
		FROM PTO_Grant<cfif NOT listcontainsnoCase(attributes.user_account_id,"ALL" )>
		WHERE PTO_Grant.user_account_id IN (<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" list="true" />)</cfif>
		GROUP BY user_account_id
	) AS Hours_Earned ON Demographics.user_account_id=Hours_Earned.user_account_id
	INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
		AND Link_Company_User_Account.company_id IN (<cfqueryparam value="#variables.user_relevant_company_id#" cfsqltype="cf_sql_integer" list="true" />)
WHERE Demographics.active_ind=1<cfif NOT listcontainsnoCase(attributes.user_account_id,"ALL" )>
	AND Demographics.user_account_id IN (<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" list="true" />)</cfif>
ORDER BY Demographics.last_name, Demographics.first_name
</cfquery>

<cfquery name="get_pto_hours_summary" dbtype="query">
SELECT SUM(pto_used_hours) AS pto_used_hours,  SUM(pto_hours_earned) AS pto_hours_earned,  SUM(remain) AS remain
FROM pto_hours
</cfquery>
</cfsilent>