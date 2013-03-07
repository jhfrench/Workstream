
<!--Tools/pag_insert_rate_change.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I do the insert of new customer rates.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>

<cfloop list="#attributes.combination_key#" index="variables.key_ii">
	<cfset variables.project_id=listfirst(variables.key_ii,"_")>
	<cfset variables.user_account_id=listgetat(variables.key_ii,2,"_")>
	<cfset variables.billing_rate_id=listlast(variables.key_ii,"_")>
	<cfset variables.rate=evaluate("attributes.rate_#variables.project_id#_#variables.user_account_id#_#variables.billing_rate_id#")>
	<cfif len(variables.rate)>
		<cfset variables.rate_start_date=createodbcdate(evaluate("attributes.rate_#variables.project_id#_#variables.user_account_id#_#variables.billing_rate_id#)")>
		<cfset variables.rate_end_date=createodbcdate(evaluate("attributes.rate_#variables.project_id#_#variables.user_account_id#_#variables.billing_rate_id#)")>
		<cfquery name="update_billing_rate" datasource="#application.datasources.main#">
			<cfif variables.billing_rate_id>
			UPDATE Billing_Rate
			SET rate=<cfqueryparam cfsqltype="cf_sql_numeric" value="#variables.rate#">,
				rate_start_date=<cfqueryparam cfsqltype="cf_sql_date" value="#variables.rate_start_date#">
				rate_end_date=<cfqueryparam cfsqltype="cf_sql_date" value="#variables.rate_end_date#">
			WHERE billing_rate_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#variables.billing_rate_id#">
				AND (
					rate!=<cfqueryparam cfsqltype="cf_sql_numeric" value="#variables.rate#">
					OR rate_start_date!=<cfqueryparam cfsqltype="cf_sql_date" value="#variables.rate_start_date#">
					OR rate_end_date!=<cfqueryparam cfsqltype="cf_sql_date" value="#variables.rate_end_date#">
				);
			<cfelseif len(variables.rate)>
			INSERT INTO Billing_Rate(project_id, user_account_id, rate,
				rate_start_date, rate_end_date, created_by)
			VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#variables.project_id#">,<cfqueryparam cfsqltype="cf_sql_integer" value="#variables.user_account_id#">, <cfqueryparam cfsqltype="cf_sql_numeric" value="#variables.rate#">,
				<cfqueryparam cfsqltype="cf_sql_date" value="#variables.rate_start_date#">, <cfqueryparam cfsqltype="cf_sql_date" value="#variables.rate_end_date#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.user_identification#">);
			</cfif>
		</cfquery>
	</cfif>
</cfloop>