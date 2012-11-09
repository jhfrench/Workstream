
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
SELECT Link_User_account_Supervisor.supervisor_id, Link_User_account_Supervisor.date_start, Link_User_account_Supervisor.date_end,
	COALESCE(Emp_Contact.lname || ', ' || Emp_Contact.Name, 'NA') AS sup_name, CASE WHEN Link_User_account_Supervisor.date_end IS NULL THEN 1 ELSE 0 END AS current_supervisor_ind
FROM Link_User_account_Supervisor
	INNER JOIN Emp_Contact ON Link_User_account_Supervisor.supervisor_id=Emp_Contact.user_account_id<cfif isdefined("attributes.user_account_id") AND len(attributes.user_account_id)>
WHERE Link_User_account_Supervisor.user_account_id=#attributes.user_account_id#</cfif>
ORDER BY Link_User_account_Supervisor.date_start, Link_User_account_Supervisor.date_end, sup_name
</cfquery>
</cfsilent>
