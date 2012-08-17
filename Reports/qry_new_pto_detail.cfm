
<!-- reports/qry_get_pto_detail.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfquery name="get_pto_detail" datasource="#application.datasources.main#">
SELECT hours_out, hours_in,  transaction_date, comments
FROM
	(SELECT COALESCE(Time_Entry.hours, 0) AS hours_out, 0 AS hours_in, 
		Time_Entry.work_date as transaction_date, CAST(Notes.note AS varchar(50)) AS comments
	FROM Time_Entry
		INNER JOIN Notes ON Time_Entry.notes_id=Notes.notes_id
	WHERE Time_Entry.active_ind=1
		AND Notes.active_ind=1
		AND Time_Entry.emp_id=#attributes.emp_id#
		AND Time_Entry.project_id IN (SELECT project_id FROM Project WHERE project_type_id=1)
		AND Time_Entry.work_date >= #createodbcdatetime(Get_PTO_Start.pto_start_date)#
		AND EXTRACT(YEAR FROM Time_Entry.work_date) >= EXTRACT(YEAR FROM CURRENT_TIMESTAMP)
	UNION ALL
	SELECT 0 AS hours_out, COALESCE(PTO_Grant.granted_hours, 0) AS hours_in, 
		date_granted AS transaction_date, comments
	FROM PTO_Grant
		WHERE PTO_Grant.emp_id=#attributes.emp_id#
		AND date_granted >= #createodbcdatetime(Get_PTO_Start.pto_start_date)#
		AND EXTRACT(YEAR FROM [date_granted]) >= EXTRACT(YEAR FROM CURRENT_TIMESTAMP)
) Current_Year_PTO
WHERE transaction_date >= #createodbcdatetime(Get_PTO_Start.pto_start_date)#
ORDER BY transaction_date
</cfquery>
</cfsilent>
