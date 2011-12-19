<cfquery name="emp_position_number_entry" datasource="#application.datasources.main#">
INSERT INTO Position_History (emp_id, position_id, effective_start_date)
VALUES (#emp_id#, #position_id#, GETDATE())
</cfquery>