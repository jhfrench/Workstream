<cfquery name="emp_position_number_entry" datasource="#application.datasources.main#">
INSERT INTO Link_User_Account_Employment_Position (user_account_id, employment_position_id, effective_start_date,
	created_by)
VALUES (#user_account_id#, #employment_position_id#, CURRENT_TIMESTAMP,
	#variables.user_identification#)
</cfquery>