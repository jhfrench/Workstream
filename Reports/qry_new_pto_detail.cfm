
<!-- reports/qry_get_pto_detail.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	Revision 1.1  2005/03/09 18:14:23  stetzer
	<>

	Revision 1.0  2001-12-27 16:33:55-05  long
	created the file
	||
	Variables:
	END FUSEDOC --->
<cfquery name="get_pto_detail" datasource="#application.datasources.main#">
SELECT hours_out, hours_in,  transaction_date, comments
FROM
	(SELECT ISNULL(Time_Entry.hours, 0) AS hours_out, 0 AS hours_in, 
		Time_Entry.date as transaction_date, CAST(Notes.note AS varchar(50)) AS comments
	FROM Time_Entry, Notes
  	WHERE Time_Entry.notes_id=Notes.notes_id
		AND Time_Entry.emp_id=#attributes.emp_id#
		AND Time_Entry.project_id IN (SELECT project_id FROM Project WHERE project_type_id=1)
		AND Time_Entry.date >= #createodbcdatetime(Get_PTO_Start.pto_start_date)#
		AND YEAR(Time_Entry.date) >= YEAR(GETDATE())
	UNION ALL
	SELECT 0 AS hours_out, ISNULL(PTO_Grant.granted_hours, 0) AS hours_in, 
		date_granted AS transaction_date, comments
	FROM PTO_Grant
   	WHERE PTO_Grant.emp_id=#attributes.emp_id#
		AND date_granted >= #createodbcdatetime(Get_PTO_Start.pto_start_date)#
		AND YEAR([date_granted]) >= YEAR(GETDATE())
) Current_Year_PTO
WHERE transaction_date >= #createodbcdatetime(Get_PTO_Start.pto_start_date)#
ORDER BY transaction_date
</cfquery>
</cfsilent>
