
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
SELECT Emp_Contact.name, Emp_Contact.lname, Emp_Contact.emp_id, 
	COALESCE(Hours_Taken_Table.hours_taken, 0) AS pto_hours_used, 
	COALESCE(Hours_Earned.earned_hours,0) AS pto_hours_earned, 
	COALESCE(Hours_Earned.earned_hours,0)-COALESCE(Hours_Taken_Table.hours_taken,0) AS remain
FROM Emp_Contact
	LEFT OUTER JOIN (
		SELECT SUM(Time_Entry.hours) AS hours_taken, emp_id
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.work_date >= (SELECT pto_start_date FROM REF_Company WHERE company_id = #session.workstream_company_id#)<cfif NOT listcontainsnoCase(attributes.emp_id,"ALL" )>
			AND Time_Entry.emp_id IN (#preservesinglequotes(attributes.emp_id)#)</cfif>
			AND Time_Entry.project_id=#application.application_specific_settings.pto_project_id#
		GROUP BY Emp_id
	) AS Hours_Taken_Table ON Emp_Contact.emp_id=Hours_Taken_Table.emp_id
	LEFT OUTER JOIN (
		SELECT SUM(PTO_Grant.granted_hours) AS earned_hours, emp_id
		FROM PTO_Grant<cfif NOT listcontainsnoCase(attributes.emp_id,"ALL" )>
		WHERE PTO_Grant.emp_id IN (#preservesinglequotes(attributes.emp_id)#)</cfif>
		GROUP BY emp_id
	) AS Hours_Earned ON Emp_Contact.emp_id=Hours_Earned.emp_id
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
WHERE Link_Company_Emp_Contact.company_id IN (#company_list_use#)<cfif NOT listcontainsnoCase(attributes.emp_id,"ALL" )>
	AND Emp_Contact.emp_id IN (#preservesinglequotes(attributes.emp_id)#)</cfif>
ORDER BY Emp_Contact.lname, Emp_Contact.name
</cfquery>

<cfquery name="get_pto_hours_summary" dbtype="query">
SELECT SUM(pto_hours_used) AS pto_hours_used,  SUM(pto_hours_earned) AS pto_hours_earned,  SUM(remain) AS remain
FROM pto_hours
</cfquery>
</cfsilent>