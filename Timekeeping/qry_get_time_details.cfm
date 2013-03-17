
<!--Timekeeping/qry_get_time_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->
<cfquery name="get_time_details" datasource="#application.datasources.main#">
SELECT Demographics.last_name, Time_Entry.user_account_id, Time_Entry.task_id,
	SUM(Time_Entry.hours) AS hours
FROM Time_Entry
	INNER JOIN Demographics ON Time_Entry.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Time_Entry.active_ind=1
	AND Time_Entry.task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" /><cfif isdefined("attributes.user_account_id")>
	AND Time_Entry.user_account_id=<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" /></cfif>
GROUP BY Time_Entry.user_account_id, Demographics.last_name, Time_Entry.task_id
ORDER BY Demographics.last_name
</cfquery>
</cfsilent>