
<!--reports/qry_overtime_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that retreives the sum of the hours and the codes that the overtime people have spent their time on.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

<cfquery name="indiv_codes" datasource="#application.datasources.main#">
SELECT SUM(Time_Entry.Hours) AS hours, 
    Project.description
FROM Time_Entry
	INNER JOIN Project ON Time_Entry.project_id = Project.project_id
WHERE Time_Entry.active_ind=1
	AND Time_Entry.work_date>='#start_date#'
	AND Time_Entry.work_date<='#end_Date#'
	AND Time_Entry.emp_id=#attributes.emp_id#
GROUP BY Project.description
</cfquery>
</cfsilent>