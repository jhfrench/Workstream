
<!-- Directory/qry_get_demographics.cfm
	Author: Jeromy French-->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I am a scheduled task that runs this template and emails active employees asking if their demographic infomation is still current and accurate.
	I display a form and ask them to change the information in the prepopulated form if it is not up to date.
	If form is changed, emails is sent to judy/shiela, and database is updated.
	||
	Name: Jeromy French
	||
	Edits:
	$Log:
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	<-- user_account_id: id that identifies user to workstream
	<-- first_name: string that contains first name of the user
	<-- last_name: string that contains last name of the user
	<-- biography: biography of employee
	<-- emp_biography_id: unique identified of biography in emp-biography table.
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_demographics" datasource="#application.datasources.main#">
SELECT Demographics.user_account_id, Demographics.last_name, Demographics.first_name,
	Emp_Biography.biography, Emp_Biography.emp_biography_id
FROM Employee
	INNER JOIN Demographics ON Employee.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1<cfif isdefined("variables.user_identification") and len(variables.user_identification)>
		AND Demographics.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" /></cfif>
	LEFT OUTER JOIN Emp_Biography ON Demographics.user_account_id=Emp_Biography.user_account_id
		AND Emp_Biography.active_ind=1
ORDER BY Demographics.last_name, Demographics.first_name
</cfquery>
<cfif len(get_demographics.recordcount)>
	<cfset variables.user_account_id=get_demographics.user_account_id>
</cfif>
