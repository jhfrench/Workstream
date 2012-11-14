
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
FROM Demographics, Sick_Bank,
	(SELECT user_account_id, SUM(hours) AS used_hours
	FROM Time_Entry
	WHERE Time_Entry.active_ind=1
		AND project_id=1881
		AND user_account_id IN (<cfif comparenocase(attributes.user_account_id,"all")>#attributes.user_account_id#<cfelse>#valuelist(get_pto_names.user_account_id)#</cfif>)
	GROUP BY user_account_id) AS Time_Taken
WHERE Demographics.user_account_id*=Sick_Bank.user_account_id
	AND Demographics.user_account_id*=Time_Taken.user_account_id
	AND Demographics.user_account_id IN (<cfif comparenocase(attributes.user_account_id,"all")>#attributes.user_account_id#<cfelse>#valuelist(get_pto_names.user_account_id)#</cfif>)
ORDER BY Demographics.last_name, Demographics.first_name
</cfquery>
</cfsilent>

