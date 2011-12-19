<cfset date_now =  now()>

<cfquery name="emp_position_number_entry" datasource="#application.datasources.main#">
INSERT INTO Position_History
	(emp_id,
	 position_id,
	 effective_startdate
	 )
VALUES
	(#emp_id#,
	 #position_id#,
	 #date_now#
	 )
	 
</cfquery>