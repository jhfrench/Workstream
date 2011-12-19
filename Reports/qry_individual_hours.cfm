<!--Reports/qry_individual_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the individual hours report.

	||
	Edits:
	$Log$
	Revision 1.2  2006/08/17 16:00:28  jlittle
	Task #47019 - Removing join to Demographics table - it was causing duplicate rows to be returned, and making some other improvements that JF suggested

	Revision 1.1  2005-03-09 13:13:49-05  stetzer
	<>

	Revision 1.2  2001-12-06 14:35:03-05  french
	Applying style sheet correctly to Reports module. Adding Customers.description to output.

	Revision 1.1  2001-10-11 11:03:57-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfquery name="get_hours" datasource="#application.datasources.main#">
SELECT Time_Entry.date AS date, Time_Entry.hours, Notes.note AS notes,
	CASE WHEN Customers.description != Project.description <cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		THEN (Project.project_code + ' - ' + Customers.description + ' - ' + Project.description) 
		ELSE (Project.project_code + ' - ' + Project.description)
	<cfelse>
		THEN (Customers.description + ' - ' + Project.description + ' (' + Project.project_code + ')') 
		ELSE (Project.description + ' (' + Project.project_code + ')') 
	</cfif>
	END AS project_display
FROM Time_Entry, Notes, Project, Customers
WHERE Time_Entry.notes_id=Notes.notes_id
	AND Time_Entry.project_id=Project.project_id
	AND Project.customers_id=Customers.customers_id
	AND Time_Entry.date BETWEEN #createodbcdate(from_date)# AND #createodbcdate(through_date)#
	AND Time_Entry.emp_id=#emp_id#
ORDER BY Time_Entry.date, project_display, Time_Entry.hours
</cfquery>
</cfsilent>
