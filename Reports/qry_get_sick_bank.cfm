
<!--Reports/qry_get_sick_bank.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I run the queries that show PTO-elligible employees in the drop-down selection.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfquery name="get_sick_bank" datasource="#application.datasources.main#">
SELECT Demographics.last_name, Demographics.first_name, COALESCE(Sick_Bank.granted_hours,0) AS granted_hours,
	COALESCE(Time_Taken.used_hours,0) AS used_hours, COALESCE(Sick_Bank.granted_hours,0)-COALESCE(Time_Taken.used_hours,0) AS remaining_hours
FROM Demographics
	LEFT OUTER JOIN Sick_Bank ON Demographics.user_account_id=Sick_Bank.user_account_id
		AND Sick_Bank.active_ind=1
	LEFT OUTER JOIN (
		SELECT user_account_id, SUM(hours) AS used_hours
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
			AND project_id=1881
			AND user_account_id IN (<cfqueryparam cfsqltype="cf_sql_integer" list="true" value="#attributes.user_account_id#" />)
		GROUP BY user_account_id
	) AS Time_Taken ON Demographics.user_account_id=Time_Taken.user_account_id
WHERE Demographics.active_ind=1
	AND Demographics.user_account_id IN (<cfqueryparam cfsqltype="cf_sql_integer" list="true" value="#attributes.user_account_id#" />)
ORDER BY Demographics.last_name, Demographics.first_name
</cfquery>
</cfsilent>