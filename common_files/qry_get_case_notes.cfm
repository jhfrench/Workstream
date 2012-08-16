
<!--common_files/qry_get_case_notes.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get all the notes entered for a case/engagement.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_case_notes" datasource="#application.datasources.main#">
	Select t.description, note,entry_date, p.description as claimant, n.date, p.project_code, t.name
	FROM task t left outer join notes n on n.task_id = t.task_id 
	inner join  project p on t.project_id = p.project_id
	Where t.project_id = #attributes.project_id#
	ORDER BY t.task_id, entry_date
</cfquery>
</cfsilent>
