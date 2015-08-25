
<!--common_files/qry_insert_link_user_account_employment_position.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I record a new employee's position number
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> variables.user_identification: integer that identifies a user
	END FUSEDOC --->
</cfsilent>
<cfquery name="insert_link_user_account_employment_position" datasource="#application.datasources.main#">
INSERT INTO Link_User_Account_Employment_Position (user_account_id, employment_position_id, effective_start_date,
	created_by)
VALUES (<cfqueryparam value="#user_account_id#" cfsqltype="cf_sql_integer" />, #employment_position_id#, CURRENT_TIMESTAMP,
	<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
</cfquery>