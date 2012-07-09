
<!--Timekeeping/qry_pto_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I determine how many PTO hours an employee has available
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource AS mapped in CF administrator
	--> session.user_account_id: number that uniquely identifies the user
 --->

<cfset company_list_use = listappend(session.workstream_selected_company_id, session.workstream_company_id)>
<cfquery name="pto_blurb" cachedwithin="#createtimespan(0,0,10,0)#" datasource="#application.datasources.main#">
SELECT ISNULL(Remainder.remain,0) AS remain, ISNULL(Remainder.remain,0)+ISNULL(Last_Month_Taken.hours_taken,0)-ISNULL(Last_Month_Earned.earned_hours,0) AS last_month, disable_pto
FROM (
	SELECT ISNULL(Hours_Taken_Table.hours_taken, 0) AS PTO_hours_used, 
		ISNULL(Hours_Earned.earned_hours,0) AS pto_hours_earned, 
		ISNULL(Hours_Earned.earned_hours,0)-ISNULL(Hours_Taken_Table.hours_taken,0) AS remain,
		Security.disable_pto
	FROM
		(SELECT SUM(Time_Entry.hours) AS hours_taken, emp_id
		FROM Time_Entry
		WHERE Time_Entry.date >= (
				SELECT pto_start_date
				FROM REF_Company
				WHERE company_id = #session.workstream_company_id#
			)
			AND Time_Entry.emp_id=#session.user_account_id#
			AND Time_Entry.project_id IN (SELECT project_id FROM Project WHERE project_type_id = 1)
		GROUP BY Emp_id) AS Hours_Taken_Table,
		(SELECT SUM(PTO_Grant.granted_hours) AS earned_hours, emp_id
		FROM PTO_Grant
		WHERE PTO_Grant.emp_id=#session.user_account_id#
		GROUP BY emp_id) AS Hours_Earned, 
		Security, Link_Company_Emp_Contact
	WHERE Security.emp_id *= Hours_Taken_Table.emp_id 
		AND Link_Company_Emp_Contact.emp_id = Security.emp_id
		AND Hours_Earned.emp_id =* Security.emp_id
		AND Link_Company_Emp_Contact.company_id IN (#company_list_use#)
		AND Security.emp_id=#session.user_account_id#) Remainder,
	(SELECT SUM(Time_Entry.hours) AS hours_taken
	FROM Time_Entry
	WHERE MONTH(Time_Entry.date)=MONTH(GETDATE())
		AND YEAR(Time_Entry.date)=YEAR(GETDATE())
		AND Time_Entry.emp_id=#session.user_account_id#
		AND Time_Entry.project_id IN (SELECT project_id FROM Project WHERE project_type_id = 1)
	) AS Last_Month_Taken,
	(SELECT SUM(PTO_Grant.granted_hours) AS earned_hours
	FROM PTO_Grant
	WHERE MONTH(PTO_Grant.date_granted)=MONTH(GETDATE())
		AND YEAR(PTO_Grant.date_granted)=YEAR(GETDATE())
		AND PTO_Grant.emp_id=#session.user_account_id#
	) AS Last_Month_Earned
</cfquery>
</cfsilent>
