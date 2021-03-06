
<!--Timekeeping/qry_get_pto_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I determine how many PTO hours an employee has available
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource AS mapped in CF administrator
	--> variables.user_identification: number that uniquely identifies the user
 --->

<cfset variables.user_relevant_company_id=listappend(session.workstream_selected_company_id, session.workstream_company_id)>
<cfquery name="get_pto_blurb" cachedwithin="#createtimespan(0,0,10,0)#" datasource="#application.datasources.main#">
SELECT COALESCE(Remainder.remain,0) AS remain, COALESCE(Remainder.remain,0)+COALESCE(Last_Month_Taken.hours_taken,0)-COALESCE(Last_Month_Earned.earned_hours,0) AS last_month
FROM (
		SELECT User_Account.user_account_id, COALESCE(Hours_Taken_Table.hours_taken, 0) AS PTO_used_hours, COALESCE(Hours_Earned.earned_hours,0) AS pto_hours_earned,
			COALESCE(Hours_Earned.earned_hours,0)-COALESCE(Hours_Taken_Table.hours_taken,0) AS remain
		FROM User_Account
			INNER JOIN Link_Company_User_Account ON User_Account.user_account_id=Link_Company_User_Account.user_account_id
			LEFT OUTER JOIN (
				SELECT SUM(Time_Entry.hours) AS hours_taken, user_account_id
				FROM Time_Entry
				WHERE Time_Entry.active_ind=1
					AND Time_Entry.work_date >= (
						SELECT pto_start_date
						FROM REF_Company
						WHERE company_id=<cfqueryparam value="#session.workstream_company_id#" cfsqltype="cf_sql_integer" />
					)
					AND Time_Entry.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
					AND Time_Entry.project_id=<cfqueryparam value="#application.application_specific_settings.pto_project_id#" cfsqltype="cf_sql_integer" />
				GROUP BY user_account_id
			) AS Hours_Taken_Table ON User_Account.user_account_id=Hours_Taken_Table.user_account_id
			LEFT OUTER JOIN (
				SELECT SUM(PTO_Grant.granted_hours) AS earned_hours, user_account_id
				FROM PTO_Grant
				WHERE PTO_Grant.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
				GROUP BY user_account_id
			) AS Hours_Earned ON User_Account.user_account_id=Hours_Earned.user_account_id
		WHERE Link_Company_User_Account.company_id IN (<cfqueryparam value="#variables.user_relevant_company_id#" cfsqltype="cf_sql_integer" list="true" />)
			AND User_Account.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
	) AS Remainder
	LEFT OUTER JOIN (
		SELECT Time_Entry.user_account_id, SUM(Time_Entry.hours) AS hours_taken
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
			AND EXTRACT(MONTH FROM Time_Entry.work_date)=EXTRACT(MONTH FROM CURRENT_DATE)
			AND EXTRACT(YEAR FROM Time_Entry.work_date)=EXTRACT(YEAR FROM CURRENT_DATE)
			AND Time_Entry.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
			AND Time_Entry.project_id IN (
				SELECT project_id
				FROM Project
				WHERE project_id=<cfqueryparam value="#application.application_specific_settings.pto_project_id#" cfsqltype="cf_sql_integer" />
			)
		GROUP BY Time_Entry.user_account_id
	) AS Last_Month_Taken ON Remainder.user_account_id=Last_Month_Taken.user_account_id
	LEFT OUTER JOIN (
		SELECT PTO_Grant.user_account_id, SUM(PTO_Grant.granted_hours) AS earned_hours
		FROM PTO_Grant
		WHERE EXTRACT(MONTH FROM PTO_Grant.date_granted)=EXTRACT(MONTH FROM CURRENT_DATE)
			AND EXTRACT(YEAR FROM PTO_Grant.date_granted)=EXTRACT(YEAR FROM CURRENT_DATE)
			AND PTO_Grant.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
		GROUP BY PTO_Grant.user_account_id
	) AS Last_Month_Earned ON Remainder.user_account_id=Last_Month_Earned.user_account_id
</cfquery>
</cfsilent>
