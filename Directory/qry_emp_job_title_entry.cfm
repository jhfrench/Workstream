
<!--Directory/qry_emp_job_title_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a job title record.
	||
	Name: Jeromy French
	||
	Edits: 

	 || 

 --->


<cfquery name="get_old_job" datasource="#application.datasources.main#">
SELECT TOP 1 job_title_id
FROM Job_Title
WHERE emp_id = '#attributes.emp_id#'
		AND active_ind = 1
ORDER BY date_start DESC
</cfquery>

<cfif get_old_job.recordcount>
	<cfset variables.deactivate_record = 1>
<cfelse>
	<cfset variables.deactivate_record = 0>
</cfif>

<cfquery name="emp_job_entry" datasource="#application.datasources.main#">
INSERT INTO Job_Title (emp_id, date_start, active_ind,
	 title)
VALUES (#attributes.emp_id#, '#attributes.date_start#', 1,
	'#attributes.title#')
</cfquery>

<cfif deactivate_record>
	<cfquery name="emp_job_update" datasource="#application.datasources.main#">
	UPDATE Job_Title
	SET date_end = CURRENT_TIMESTAMP,
		active_ind = 0
	WHERE job_title_id = #get_old_job.job_title_id#
	</cfquery>
</cfif>

</cfsilent>

