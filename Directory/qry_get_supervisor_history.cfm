
<!--Directory/qry_get_supervisor_history.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve supervisor history based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	--> attributes.user_account_id: number containing the unique identifier of the individual being requested

 --->
<cfquery name="get_supervisor_history" datasource="#application.datasources.main#">
SELECT Link_User_Account_Supervisor.supervisor_id, Link_User_Account_Supervisor.date_start, Link_User_Account_Supervisor.date_end,
	COALESCE(Demographics.last_name || ', ' || Demographics.first_name, 'NA') AS sup_name, CASE WHEN Link_User_Account_Supervisor.date_end IS NULL THEN 1 ELSE 0 END AS current_supervisor_ind
FROM Link_User_Account_Supervisor
	INNER JOIN Demographics ON Link_User_Account_Supervisor.supervisor_id=Demographics.user_account_id
		AND Demographics.active_ind=1<cfif isdefined("attributes.user_account_id") AND len(attributes.user_account_id)>
WHERE Link_User_Account_Supervisor.user_account_id=#attributes.user_account_id#</cfif>
ORDER BY Link_User_Account_Supervisor.date_start, Link_User_Account_Supervisor.date_end, sup_name
</cfquery>
</cfsilent>
