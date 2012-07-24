<!--Reports/qry_individual_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the individual hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_hours" datasource="#application.datasources.main#">
SELECT Time_Entry.date AS date, Time_Entry.hours, Notes.note AS notes,
	CASE WHEN Customer.description != Project.description <cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		THEN (Project.project_code || '-' || Customer.description || '-' || Project.description) 
		ELSE (Project.project_code || '-' || Project.description)
	<cfelse>
		THEN (Customer.description || '-' || Project.description || ' (' ||  Project.project_code || ')') 
		ELSE (Project.description || ' (' ||  Project.project_code || ')') 
	</cfif>
	END AS project_display
FROM Time_Entry, Notes, Project, Customer
WHERE Time_Entry.notes_id=Notes.notes_id
	AND Time_Entry.project_id=Project.project_id
	AND Project.customer_id=Customer.customer_id
	AND Time_Entry.active_ind=1
	AND Time_Entry.date BETWEEN #createodbcdate(from_date)# AND #createodbcdate(through_date)#
	AND Time_Entry.emp_id=#emp_id#
ORDER BY Time_Entry.date, project_display, Time_Entry.hours
</cfquery>
</cfsilent>
