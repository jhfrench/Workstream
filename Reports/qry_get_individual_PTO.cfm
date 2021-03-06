
<!--Reports/qry_get_individual_PTO.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_individual_PTO" datasource="#application.datasources.main#"> 
SELECT Time_entry.hours, Time_Entry.work_date
FROM PTO_Hours
	INNER JOIN Time_entry ON PTO_Hours.user_account_id=Time_entry.user_account_id
WHERE Time_Entry.active_ind=1
	AND PTO_Hours.user_account_id='#attributes.drill_down#'
	AND Time_entry.project_id IN (
		SELECT project_id
		FROM Project
		WHERE project_id=#application.application_specific_settings.pto_project_id#
	)
	and EXTRACT(YEAR FROM Time_Entry.work_date) = EXTRACT(YEAR FROM CURRENT_DATE)
ORDER BY Time_Entry.work_date
</cfquery>