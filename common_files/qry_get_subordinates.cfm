
<!--common_files/qry_get_subordinates.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French (jeromy_french@hotmail.com)
	||
	Edits:
	$Log$
	 || 
 --->
<cfparam name="attributes.all_employees" default="0">
</cfsilent>
<!--- $issue$: convert this to use a recursive query someday (right now it only returns immediate subordinates), similar to Directory/qry_get_subordinates.cfm --->
<cfquery name="get_subordinates" datasource="#application.datasources.main#">
SELECT Demographics.first_name, Demographics.last_name, (LEFT(Demographics.first_name,1) || LEFT(Demographics.last_name,1)) AS initials,
	Demographics.user_account_id, Demographics.last_name || ', ' || LEFT(Demographics.first_name,2) AS display
FROM Demographics
	INNER JOIN Link_User_Account_Supervisor ON Demographics.user_account_id=Link_User_Account_Supervisor.user_account_id
		AND Link_User_Account_Supervisor.active_ind=1
		AND (Link_User_Account_Supervisor.supervisor_id=#variables.user_identification#<cfif NOT isdefined("attributes.hide_supervisor")>
			OR Demographics.user_account_id=#variables.user_identification#</cfif>)
	INNER JOIN Employee ON Demographics.user_account_id=Employee.user_account_id
		AND Employee.active_ind=1
WHERE Demographics.active_ind=1<cfif NOT attributes.all_employees>
<cfif isdefined("attributes.date_linked")>/*we're looking for the organization at a specified point in time*/
	AND <cfqueryparam cfsqltype="cf_sql_date" value="#attributes.date_linked#" /> BETWEEN Link_User_Account_Supervisor.date_start AND COALESCE(Link_User_Account_Supervisor.date_end, CURRENT_TIMESTAMP)
	AND <cfqueryparam cfsqltype="cf_sql_date" value="#attributes.date_linked#" /> BETWEEN Employee.hire_date AND COALESCE(Employee.turnover_date, CURRENT_TIMESTAMP)
<cfelseif isdefined("attributes.start_date") AND isdefined("attributes.end_date")>/*this is the goal-post scenario*/
	AND Link_User_Account_Supervisor.date_start < #attributes.end_date#
	AND COALESCE(Link_User_Account_Supervisor.date_end, #dateadd("d", 1, attributes.start_date)#) > #attributes.start_date#
	AND Employee.hire_date < #attributes.end_date#
	AND COALESCE(Employee.turnover_date, #dateadd("d", 1, attributes.start_date)#) > #attributes.start_date#
<cfelse>/*we're looking for the organization as it currently stands*/
	AND CURRENT_DATE BETWEEN Link_User_Account_Supervisor.date_start AND COALESCE(Link_User_Account_Supervisor.date_end, CURRENT_TIMESTAMP)
	AND CURRENT_DATE BETWEEN Employee.hire_date AND COALESCE(Employee.turnover_date, CURRENT_TIMESTAMP)
</cfif>
</cfif>
GROUP BY Demographics.last_name, Demographics.first_name, Demographics.user_account_id
ORDER BY Demographics.last_name, Demographics.first_name, Demographics.user_account_id
</cfquery>
<cfset variables.subordinates_user_account_id=valuelist(get_subordinates.user_account_id)>