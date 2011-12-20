
<!-- reports/qry_new_pto_detail.cfm
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
SELECT hours_out, hours_in,  transaction_date, comments, time_entry_id
FROM
	(SELECT ISNULL(Time_Entry.hours, 0) AS hours_out, 0 AS hours_in, 
		Time_Entry.date as transaction_date, CAST(Notes.note AS varchar(50)) AS comments, Time_Entry.time_entry_id AS time_entry_id
	FROM Time_Entry, Notes
  	WHERE Time_Entry.notes_id=Notes.notes_id
		AND Time_Entry.emp_id=#attributes.emp_id#
		AND Time_Entry.project_id IN (SELECT project_id FROM Project WHERE project_type_id=1)
		AND Time_Entry.date >= #createodbcdatetime(Get_PTO_Start.pto_start_date)#
	UNION ALL
	SELECT 0 AS hours_out, ISNULL(PTO_Grant.granted_hours, 0) AS hours_in, 
		date_granted AS transaction_date, comments, 0 AS time_entry_id
	FROM PTO_Grant
   	WHERE PTO_Grant.emp_id=#attributes.emp_id#
		AND PTO_Grant.date_granted >= #createodbcdatetime(Get_PTO_Start.pto_start_date)#
) Current_Year_PTO
ORDER BY transaction_date
</cfquery>
</cfsilent>