<cfquery name="emp_position_number_entry" datasource="#application.datasources.main#">
INSERT INTO Position_History (user_account_id, employment_position_id, effective_start_date)
VALUES (#user_account_id#, #employment_position_id#, CURRENT_TIMESTAMP)
</cfquery>