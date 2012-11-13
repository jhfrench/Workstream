
<!-- Reports/qry_get_pto_summary.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the rollup of the PTO HOURS report

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfset company_list_use = listappend(session.workstream_selected_company_id, session.workstream_company_id)>
<cfquery name="pto_hours" datasource="#application.datasources.main#">
SELECT Emp_Contact.name, Emp_Contact.lname, Emp_Contact.user_account_id, 
	COALESCE(Hours_Taken_Table.hours_taken, 0) AS pto_used_hours, 
	COALESCE(Hours_Earned.earned_hours,0) AS pto_hours_earned, 
	COALESCE(Hours_Earned.earned_hours,0)-COALESCE(Hours_Taken_Table.hours_taken,0) AS remain
FROM Emp_Contact
	LEFT OUTER JOIN (
		SELECT SUM(Time_Entry.hours) AS hours_taken, user_account_id
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.work_date >= (SELECT pto_start_date FROM REF_Company WHERE company_id = #session.workstream_company_id#)<cfif NOT listcontainsnoCase(attributes.user_account_id,"ALL" )>
			AND Time_Entry.user_account_id IN (#preservesinglequotes(attributes.user_account_id)#)</cfif>
			AND Time_Entry.project_id=#application.application_specific_settings.pto_project_id#
		GROUP BY user_account_id
	) AS Hours_Taken_Table ON Emp_Contact.user_account_id=Hours_Taken_Table.user_account_id
	LEFT OUTER JOIN (
		SELECT SUM(PTO_Grant.granted_hours) AS earned_hours, user_account_id
		FROM PTO_Grant<cfif NOT listcontainsnoCase(attributes.user_account_id,"ALL" )>
		WHERE PTO_Grant.user_account_id IN (#preservesinglequotes(attributes.user_account_id)#)</cfif>
		GROUP BY user_account_id
	) AS Hours_Earned ON Emp_Contact.user_account_id=Hours_Earned.user_account_id
	INNER JOIN Link_Company_User_Account ON Emp_Contact.user_account_id=Link_Company_User_Account.user_account_id
WHERE Link_Company_User_Account.company_id IN (#company_list_use#)<cfif NOT listcontainsnoCase(attributes.user_account_id,"ALL" )>
	AND Emp_Contact.user_account_id IN (#preservesinglequotes(attributes.user_account_id)#)</cfif>
ORDER BY Emp_Contact.lname, Emp_Contact.name
</cfquery>

<cfquery name="get_pto_hours_summary" dbtype="query">
SELECT SUM(pto_used_hours) AS pto_used_hours,  SUM(pto_hours_earned) AS pto_hours_earned,  SUM(remain) AS remain
FROM pto_hours
</cfquery>
</cfsilent>