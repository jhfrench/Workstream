
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
	COALESCE(Hours_Taken_Table.hours_taken, 0) AS PTO_hours_used, 
	COALESCE(Hours_Earned.earned_hours,0) AS pto_hours_earned, 
	COALESCE(Hours_Earned.earned_hours,0)-COALESCE(Hours_Taken_Table.hours_taken,0) AS remain
FROM (
		SELECT SUM(Time_Entry.hours) AS hours_taken, emp_id
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.date >= (SELECT pto_start_date FROM REF_Company WHERE company_id = #session.workstream_company_id#)<cfif NOT listcontainsnoCase(attributes.form_Pin,"ALL" )>
			AND (Time_Entry.emp_id IN (#preservesinglequotes(attributes.form_pin)#))</cfif>
			AND Time_Entry.project_id IN (SELECT project_id FROM Project WHERE project_type_id = 1)
		GROUP BY Emp_id
	) AS Hours_Taken_Table,
	(
		SELECT SUM(PTO_Grant.granted_hours) AS earned_hours, emp_id
		FROM PTO_Grant<cfif NOT listcontainsnoCase(attributes.form_Pin,"ALL" )>
		WHERE PTO_Grant.emp_id IN (#preservesinglequotes(attributes.form_pin)#)</cfif>
		GROUP BY emp_id
	) AS Hours_Earned, 
	Emp_Contact, Link_Company_Emp_Contact
WHERE Emp_Contact.emp_id *= Hours_Taken_Table.emp_id 
	AND Link_Company_Emp_Contact.emp_id = Emp_Contact.emp_id
	AND Hours_Earned.emp_id =* Emp_Contact.emp_id
	AND Link_Company_Emp_Contact.company_id IN (#company_list_use#)<cfif NOT listcontainsnoCase(attributes.form_pin,"ALL" )>
	AND Emp_Contact.emp_id IN (#preservesinglequotes(attributes.form_pin)#)</cfif>
ORDER BY Emp_Contact.lname, Emp_Contact.name
</cfquery>
</cfsilent>
