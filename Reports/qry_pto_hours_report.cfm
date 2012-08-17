
<!--Reports/qry_pto_hours_report.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I populate the LCI version of the PTO report.

	||
	Edits:
	$Log$ 
	 || 
	END FUSEDOC --->
<cfquery name="GetEmpDetails" datasource="#application.datasources.main#">
<cfif isdefined("attributes.drill_down")> 
SELECT Emp_Contact.Name AS name, 
    Emp_Contact.LName AS lname, Emp_Contact.emp_id AS pin, 
    PTO_Hours.Pto_Type_Indicator, REF_Day_Length.Day_Length, 
    REF_Company.description AS company
FROM Emp_Contact
	INNER JOIN PTO_Hours ON Emp_Contact.emp_id=PTO_Hours.emp_id
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
	INNER JOIN Demographics ON Emp_Contact.emp_id=Demographics.emp_id
	INNER JOIN REF_Company ON Link_Company_Emp_Contact.company_id = REF_Company.company_id LEFT OUTER
     JOIN
    REF_Day_Length ON Demographics.Day_Length_ID = REF_Day_Length.Day_Length_ID
WHERE (Link_Company_Emp_Contact.company_id IN
	(select company_id 
	from Security_Company_Access 
	where emp_id=#session.user_account_id#)) 
AND (Emp_Contact.emp_id IN ('#preservesinglequotes(attributes.drill_down)#'))
ORDER BY lname
<cfelse>
SELECT DISTINCT Emp_Contact.Name AS name, Emp_Contact.LName AS lname, 
	Emp_Contact.emp_id AS pin, Used_Hours.used_hours AS used_hours,
		COALESCE(REF_Day_Length.Day_Length, 8) AS day_length, PTO_Hours.pto_type_indicator AS pto_type_indicator
FROM Security_Company_Access, Emp_Contact, PTO_Hours, Demographics, REF_Day_Length, security,
	(SELECT COALESCE(SUM(Time_Entry.hours),0) AS used_hours, Link_Company_Emp_Contact.emp_id AS emp_id
	FROM Time_entry, Link_Company_Emp_Contact
	WHERE Time_Entry.active_ind=1
		AND time_entry.project_id IN (SELECT project_id
									FROM Project
									WHERE project_type_id = 1)
		AND Link_Company_Emp_Contact.company_id IN 
			(SELECT company_id 
			FROM Security_Company_Access 
			WHERE emp_id=#session.user_account_id#)
		AND Link_Company_Emp_Contact.emp_id*=Time_Entry.emp_id
		AND EXTRACT(YEAR FROM Time_Entry.work_date) = EXTRACT(YEAR FROM CURRENT_DATE)
	GROUP BY Link_Company_Emp_Contact.emp_id)
AS Used_Hours
WHERE Security_Company_Access.emp_id=emp_contact.emp_id
	and  Security_Company_Access.company_id IN
	(select company_id 
	from Security_Company_Access 
	where emp_id=#session.user_account_id#)
		AND Emp_Contact.emp_id=Security.emp_id
		AND Emp_Contact.emp_id=Used_Hours.emp_id
		AND Emp_Contact.emp_id=PTO_Hours.emp_id
		AND Emp_Contact.emp_id=Demographics.emp_id
		AND Demographics.Day_Length_ID *= REF_Day_Length.Day_Length_ID
		AND Demographics.Effective_To IS NULL 
		And Security.Disable!=1
		<cfif NOT listcontainsnoCase(attributes.emp_id,"ALL" )> AND (Emp_Contact.emp_id IN (#preservesinglequotes(attributes.emp_id)#))</cfif>
ORDER BY lname
</cfif>
</cfquery>
</cfsilent>

