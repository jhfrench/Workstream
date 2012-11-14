
<!--Directory/qry_get_open_positions.cfm
	Author: Jeromy F -->

	<!---FUSEDOC
	||
	Responsibilities: I query the open positions from the positions table. 
	||
	Name: Jeromy French
	||
	Edits: 

	 || 

 --->

<cfquery name="get_open_positions" datasource="#application.datasources.main#">
SELECT * 
FROM Position
	LEFT OUTER JOIN (
		SELECT employment_position_id, effective_start_date, effective_end_date
		FROM Position_History,
			(
				SELECT MAX(position_history_id) AS position_history_id
				FROM Position_History
				GROUP BY employment_position_id
			) AS inner_query
		Where Position_History.position_history_id = Inner_Query.position_history_id
	) AS Inner_Query2 ON Positions.employment_position_id = Inner_Query2.employment_position_id
WHERE active_ind = 1 
	AND (
		(
			Inner_Query2.employment_position_id IS NOT NULL
				AND Inner_Query2.effective_end_date < CURRENT_TIMESTAMP
		)
	or 
		(
			Inner_Query2.employment_position_id IS NULL
		)
)
</cfquery>