
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
SELECT Emp_Contact.emp_id AS pin, Emp_Contact.name, Emp_Contact.lname,
    PTO_Hours.Pto_Type_Indicator, REF_Day_Length.Day_Length, 
    REF_Company.description AS company
FROM Emp_Contact
	INNER JOIN PTO_Hours ON Emp_Contact.emp_id=PTO_Hours.emp_id
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
	INNER JOIN Demographics ON Emp_Contact.emp_id=Demographics.emp_id
	INNER JOIN REF_Company ON Link_Company_Emp_Contact.company_id = REF_Company.company_id
	LEFT OUTER JOIN REF_Day_Length ON Demographics.day_length_id = REF_Day_Length.day_length_id
WHERE Link_Company_Emp_Contact.company_id IN (
		SELECT company_id 
		FROM Security_Company_Access 
		WHERE emp_id=#variables.user_identification#
	)
AND (Emp_Contact.emp_id IN ('#preservesinglequotes(attributes.drill_down)#'))
ORDER BY lname
<cfelse>
SELECT DISTINCT Emp_Contact.name, Emp_Contact.lname, Emp_Contact.emp_id AS pin<!--- $issue$ how is this used? can it be converted to emp_id or user_account_id? --->,
	Used_Hours.used_hours, COALESCE(REF_Day_Length.day_length, 8) AS day_length, PTO_Hours.pto_type_indicator
FROM Security_Company_Access
	INNER JOIN Emp_Contact ON Security_Company_Access.emp_id=Emp_Contact.emp_id
	INNER JOIN PTO_Hours ON Emp_Contact.emp_id=PTO_Hours.emp_id
	INNER JOIN Demographics ON Emp_Contact.emp_id=Demographics.emp_id
		AND Demographics.Effective_To IS NULL 
	LEFT OUTER JOIN REF_Day_Length ON Demographics.day_length_id=REF_Day_Length.day_length_id
	INNER JOIN Link_User_Account_Status ON Link_User_Account_Status.user_account_id=Emp_Contact.emp_id
		AND Link_User_Account_Status.active_ind=1
		AND Link_User_Account_Status.account_status_id=1 /*active*/
	INNER JOIN (
		SELECT Link_Company_Emp_Contact.emp_id, COALESCE(SUM(Time_Entry.hours),0) AS used_hours
		FROM Link_Company_Emp_Contact
			LEFT OUTER JOIN Time_Entry ON Link_Company_Emp_Contact.emp_id=Time_Entry.emp_id
				AND Time_Entry.active_ind=1
				AND EXTRACT(YEAR FROM Time_Entry.work_date) = EXTRACT(YEAR FROM CURRENT_DATE)
				AND Time_Entry.project_id IN (
					SELECT project_id
					FROM Project
					WHERE project_type_id = 1
				)
		WHERE Link_Company_Emp_Contact.company_id IN (
				SELECT company_id 
				FROM Security_Company_Access 
				WHERE emp_id=#variables.user_identification#
			)
		GROUP BY Link_Company_Emp_Contact.emp_id
	) AS Used_Hours ON Emp_Contact.emp_id=Used_Hours.emp_id
WHERE Security_Company_Access.company_id IN (
		SELECT company_id 
		FROM Security_Company_Access 
		WHERE emp_id=#variables.user_identification#
	)<cfif NOT listcontainsnoCase(attributes.emp_id,"ALL" )>
	AND Emp_Contact.emp_id IN (#preservesinglequotes(attributes.emp_id)#)</cfif>
ORDER BY lname
</cfif>
</cfquery>
</cfsilent>
