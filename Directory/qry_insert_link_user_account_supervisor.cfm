
<!--Directory/qry_insert_link_user_account_supervisor.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a supervisor record.
	||
	Name: Jeromy French
	||
	Edits:

	 ||

 --->
</cfsilent>
<cfparam default="0" name="attributes.supervisor_id_list">
<cfparam default="0" name="attributes.present_supervisor_id">
<cfif isdefined("attributes.hire_date")>
	<cfset attributes.date_start=attributes.hire_date>
</cfif>
<cfif isdefined("attributes.date_start")>
	<cfquery name="insert_link_user_account_supervisor" datasource="#application.datasources.main#">
	INSERT INTO Link_User_Account_Supervisor (user_account_id, supervisor_id, date_start,
		active_ind, created_by)
	VALUES (<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#attributes.supervisor_id#" cfsqltype="cf_sql_integer" />, #createodbcdate(attributes.date_start)#,
		1, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
	</cfquery>
</cfif>

<!--- $issue$ is the following logic correct? --->
<cfif isdefined("attributes.end_date_#ii#") AND attributes.present_supervisor_id NEQ 0>
	<cfloop list="#attributes.present_supervisor_id#" index="supervisor_id_ii">
		<cfquery name="emp_supervisor_update" datasource="#application.datasources.main#">
		UPDATE Link_User_Account_Supervisor
		SET date_end=#createodbcdate(evaluate("attributes.end_date_#supervisor_id_ii#"))#,
			active_ind=0
		WHERE supervisor_id=<cfqueryparam value="#supervisor_id_ii#" cfsqltype="cf_sql_integer" />
			AND user_account_id=<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" />
			AND date_end IS NULL
		</cfquery>
	</cfloop>
</cfif>