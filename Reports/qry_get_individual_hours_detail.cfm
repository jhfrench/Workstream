<!--Reports/qry_get_individual_hours_detail.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the individual hours report.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfquery name="get_individual_hours_detail" datasource="#application.datasources.main#">
SELECT Demographics.last_name || ', ' || Demographics.first_name AS employee, Time_Entry.work_date, Time_Entry.hours,
	Notes.note,
	CASE WHEN Customer.description!=Project.description <cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		THEN (Project.project_code || '-' || Customer.description || '-' || Project.description)
		ELSE (Project.project_code || '-' || Project.description)
	<cfelse>
		THEN (Customer.description || '-' || Project.description || ' (' ||  Project.project_code || ')')
		ELSE (Project.description || ' (' ||  Project.project_code || ')')
	</cfif>
	END AS project_display
FROM Time_Entry
	INNER JOIN Demographics ON Time_Entry.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	INNER JOIN Notes ON Time_Entry.notes_id=Notes.notes_id
		AND Notes.active_ind=1
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
WHERE Time_Entry.active_ind=1
	AND Time_Entry.work_date BETWEEN #createodbcdate(attributes.from_date)# AND #createodbcdate(attributes.through_date)#
	AND Time_Entry.user_account_id=#attributes.user_account_id#
ORDER BY Time_Entry.work_date, project_display, Time_Entry.hours
</cfquery>

<cfquery name="get_individual_hours_summary" dbtype="query">
SELECT SUM(hours) AS hours_worked
FROM get_individual_hours_detail
</cfquery>
</cfsilent>
