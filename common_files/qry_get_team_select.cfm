
<!--common_files/qry_get_team_select.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve team members based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.team_changed: date of the last employee-themed tables were probably updated; used to drive query caching
	--> session.workstream_company_id: id that identifies company of the user to workstream
	--> session.workstream_selected_company_id: id of the companies that the employee wishes to see
	<-- company: number that contains the REF_Company.company_id for an employee
	<-- user_account_id: id that identifies user to workstream
	<-- f_init: string containing the first initial of an employee
	<-- last_name: string containing the last name of an employee
 --->
<cfparam name="session.workstream_selected_company_id" default="#session.workstream_company_id#">
<cfparam name="variables.user_account_id_match" default="">
<cfparam name="attributes.all_employees" default="0">
<!--- $issue$: Security_Company_Access should be switched over to Access_User_Account_Grouper --->
<cfquery name="get_team_select" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT Demographics.user_account_id, Demographics.last_name, Demographics.first_name,
	COALESCE(Demographics.last_name,'unknown') || ', ' || LEFT(COALESCE(Demographics.first_name,'unknown'),2) AS display<cfif isdefined("variables.email_only")>, email_type_id</cfif>
FROM Employee
	INNER JOIN Security_Company_Access ON Employee.user_account_id=Security_Company_Access.user_account_id
		AND Security_Company_Access.active_ind=1
		AND (
			Security_Company_Access.company_id IN (<cfqueryparam value="#session.workstream_selected_company_id#" cfsqltype="cf_sql_integer" list="true" />)<cfif len(variables.user_account_id_match)>
				OR Security_Company_Access.user_account_id IN (<cfqueryparam value="#variables.user_account_id_match#" cfsqltype="cf_sql_integer" list="true" />)</cfif>
		)
	INNER JOIN Demographics ON Employee.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1<cfif isdefined("variables.email_only")>
	INNER JOIN Email ON Employee.user_account_id=Email.user_account_id
		AND Email.email_type_id=1</cfif>
WHERE Employee.active_ind=1
	AND <cfqueryparam value="#application.team_changed#" cfsqltype="cf_sql_timestamp" />=<cfqueryparam value="#application.team_changed#" cfsqltype="cf_sql_timestamp" />
GROUP BY Demographics.user_account_id, Demographics.last_name, Demographics.first_name<cfif isdefined("variables.email_only")>,
	email_type_id</cfif>
ORDER BY Demographics.last_name, Demographics.first_name
</cfquery>
</cfsilent>
