
<!-- Reports/qry_get_pto_detail.cfm
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
SELECT COALESCE(hours_out,0) AS hours_out, COALESCE(hours_in,0) AS hours_in, transaction_date,
	comments, time_entry_id, EXTRACT(YEAR FROM transaction_date) AS transaction_year
FROM
	(SELECT Time_Entry.hours AS hours_out, 0 AS hours_in, Time_Entry.work_date AS transaction_date,
		CAST(Notes.note AS VARCHAR(50)) AS comments, Time_Entry.time_entry_id
	FROM Time_Entry
		INNER JOIN Notes ON Time_Entry.notes_id=Notes.notes_id
	WHERE Time_Entry.active_ind=1
		AND Notes.active_ind=1
		AND Time_Entry.user_account_id=#attributes.user_account_id#
		AND Time_Entry.project_id=#application.application_specific_settings.pto_project_id#
		AND Time_Entry.work_date >= #createodbcdatetime(get_pto_start.pto_start_date)#
	UNION ALL
	SELECT 0 AS hours_out, PTO_Grant.granted_hours AS hours_in, date_granted AS transaction_date,
		comments, 0 AS time_entry_id
	FROM PTO_Grant
	WHERE PTO_Grant.user_account_id=#attributes.user_account_id#
		AND PTO_Grant.date_granted >= #createodbcdatetime(get_pto_start.pto_start_date)#
) Current_Year_PTO
ORDER BY transaction_date
</cfquery>
</cfsilent>
