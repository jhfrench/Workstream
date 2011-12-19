
<!--Timekeeping/qry_pto_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the notes_id of the latest (and greatest) entry into Notes.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.5  2005/08/25 15:52:32  long
	task 35115- added code to make sure that the PTO query returns values for the user even if they aren't currently viewing information for the company they work for.

	Revision 1.4  2005-08-16 17:05:51-04  french
	Modified code to account for employees who don't participate in PTO benefit. Task 34921

	Revision 1.3  2005-08-11 15:04:30-04  french
	Changed query so that PTO balances can be calculated since end of previous month. Task 34645

	Revision 1.2  2005-08-02 16:16:37-04  french
	Completely revamped code to process faster and show more useful information to the user. Task 34645

	Revision 1.1  2005-03-09 13:27:03-05  stetzer
	<>

	||
	--> application.datasources.main: string that contains the name of the datasource AS mapped in CF administrator
	--> session.user_account_id: number that uniquely identifies the user
 --->

<cfset company_list_use = session.workstream_company_select_list>
<cfset company_list_use = listappend(company_list_use, session.workstream_company_id)>
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
		WHERE Time_Entry.date >= (SELECT pto_start_date FROM REF_Companies WHERE company_id = #session.workstream_company_id#)
			AND Time_Entry.emp_id=#session.user_account_id#
			AND Time_Entry.Project_id IN (SELECT project_id FROM Project WHERE project_type_id = 1)
		GROUP BY Emp_id) AS Hours_Taken_Table,
		(SELECT SUM(PTO_Grant.granted_hours) AS earned_hours, emp_id
		FROM PTO_Grant
		WHERE PTO_Grant.emp_id=#session.user_account_id#
		GROUP BY emp_id) AS Hours_Earned, 
		Security, Company
	WHERE Security.emp_id *= Hours_Taken_Table.emp_id 
		AND Company.emp_id = Security.emp_id
		AND Hours_Earned.emp_id =* Security.emp_id
		AND Company.company IN (#company_list_use#)
		AND Security.emp_id=#session.user_account_id#) Remainder,
	(SELECT SUM(Time_Entry.hours) AS hours_taken
	FROM Time_Entry
	WHERE MONTH(Time_Entry.date)=MONTH(GETDATE())
		AND YEAR(Time_Entry.date)=YEAR(GETDATE())
		AND Time_Entry.emp_id=#session.user_account_id#
		AND Time_Entry.Project_id IN (SELECT project_id FROM Project WHERE project_type_id = 1)
	) AS Last_Month_Taken,
	(SELECT SUM(PTO_Grant.granted_hours) AS earned_hours
	FROM PTO_Grant
	WHERE MONTH(PTO_Grant.date_granted)=MONTH(GETDATE())
		AND YEAR(PTO_Grant.date_granted)=YEAR(GETDATE())
		AND PTO_Grant.emp_id=#session.user_account_id#
	) AS Last_Month_Earned
</cfquery>
</cfsilent>
