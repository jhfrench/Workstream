
<!--Directory/qry_emp_supervisor_entry.cfm
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
	<cfquery name="emp_supervisor_entry" datasource="#application.datasources.main#">
	INSERT INTO Link_User_Account_Supervisor (user_account_id, supervisor_id, date_start, active_ind,
		created_by)
	VALUES (#attributes.user_account_id#, #attributes.supervisor_id#, #createodbcdate(attributes.date_start)#, 1,
		<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
	</cfquery>
</cfif>
<cfif isdefined("attributes.end_date_#ii#")>
	<cfloop list="#attributes.present_supervisor_id#" index="ii">
		<cfquery name="emp_supervisor_update" datasource="#application.datasources.main#">
		UPDATE Link_User_Account_Supervisor
		SET date_end=#createodbcdate(evaluate("attributes.end_date_#ii#"))#,
			active_ind=0
		WHERE supervisor_id=#ii#
			AND user_account_id=#attributes.user_account_id#
			AND date_end IS NULL
		</cfquery>
	</cfloop>
</cfif>