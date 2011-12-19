
<!--Reports/qry_pto_hours_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I populate the LCI version of the PTO report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:14:38  stetzer
<>

Revision 1.2  2001-10-15 12:16:11-04  long
Removed the hard coded project_id for the PTO hours and am now using the project_type_id to determine what codes are PTO.

Revision 1.1  2001-10-11 11:03:51-04  long
Added $log $ for edits to all CFM files that have fusedocs.

(KL | 8/13/01) ; changed the session.workstream_company_select_list to always be a list of all the companies that you are allowed to see.  Change made after testing and Lewico requests, for ease of useability.
(KL | 10/08/2001); Added a join to security table so that it will remove all disabled employees.
	 
	||
	END FUSEDOC --->
<cfquery name="GetEmpDetails" datasource="#application.datasources.main#">
<cfif isdefined("attributes.drill_down")>          
SELECT Emp_Contact.Name AS name, 
    Emp_Contact.LName AS lname, Emp_Contact.emp_id AS pin, 
    PTO_Hours.Pto_Type_Indicator, REF_Day_Length.Day_Length, 
    REF_Company.company
FROM Emp_Contact
	INNER JOIN PTO_Hours ON Emp_Contact.emp_id = PTO_Hours.emp_id
	INNER JOIN Company ON Emp_Contact.emp_id = Company.emp_id
	INNER JOIN Demographics ON Emp_Contact.emp_id = Demographics.emp_id
	INNER JOIN REF_Company ON Company.Company = REF_Company.Company_ID LEFT OUTER
     JOIN
    REF_Day_Length ON Demographics.Day_Length_ID = REF_Day_Length.Day_Length_ID
WHERE (company.company IN
	(select company_id 
	from Link_Company_Emp_Contact 
	where emp_id = #session.user_account_id#)) 
AND (Emp_Contact.emp_id IN ('#PreserveSingleQuotes(attributes.drill_down)#'))
ORDER BY lname
<cfelse>
SELECT DISTINCT Emp_Contact.Name AS name, Emp_Contact.LName AS lname, 
	Emp_Contact.emp_id AS pin, Used_Hours.used_hours AS used_hours,
		ISNULL(REF_Day_Length.Day_Length, 8) AS day_length, PTO_Hours.pto_type_indicator AS pto_type_indicator
FROM Link_Company_Emp_Contact, Emp_Contact, PTO_Hours, Demographics, REF_Day_Length, security,
	(SELECT ISNULL(SUM(Time_Entry.hours),0) AS used_hours, Company.emp_id AS emp_id
	FROM Time_entry, Company
	WHERE time_entry.project_id IN (SELECT project_id
									FROM Project
									WHERE project_type_id = 1)
		AND Company.company IN 
			(SELECT company_id 
			FROM Link_Company_Emp_Contact 
			WHERE emp_id = #session.user_account_id#)
		AND Company.emp_id*=Time_Entry.emp_id
		AND YEAR(time_entry.date) = YEAR(GETDATE())
	GROUP BY Company.emp_id)
AS Used_Hours
WHERE Link_Company_Emp_Contact.emp_id = emp_contact.emp_id
	and  Link_Company_Emp_Contact.company_id IN
	(select company_id 
	from Link_Company_Emp_Contact 
	where emp_id = #session.user_account_id#)
		AND Emp_Contact.emp_id=Security.emp_id  
		AND Emp_Contact.emp_id=Used_Hours.emp_id
		AND Emp_Contact.emp_id = PTO_Hours.emp_id
		AND Emp_Contact.emp_id = Demographics.emp_id
		AND Demographics.Day_Length_ID *= REF_Day_Length.Day_Length_ID
		AND Demographics.Effective_To IS NULL 
		And Security.Disable <> 1
		<cfif NOT listcontainsnoCase(attributes.form_Pin,"ALL" )> AND (Emp_Contact.emp_id IN (#PreserveSingleQuotes(attributes.form_Pin)#))</cfif>
ORDER BY lname
<!--- SELECT DISTINCT 
    Emp_Contact.Name AS name, Emp_Contact.LName AS lname, 
    Emp_Contact.emp_id AS pin, PTO_Hours.Pto_Type_Indicator, 
    ISNULL(REF_Day_Length.Day_Length, 8) AS day_length, 
    ISNULL
        ((SELECT SUM(hours) AS Used_hours
       FROM Time_entry
       WHERE time_entry.project_id IN (117, 147, 180, 365, 399, 
           513, 548, 575) AND year(time_entry.date) 
           = year(GETDATE())
	AND        emp_contact.emp_id = time_entry.emp_id), 0) 
    AS Used_hours
FROM Emp_Contact
	INNER JOIN PTO_Hours ON Emp_Contact.emp_id = PTO_Hours.emp_id
	INNER JOIN Company ON Emp_Contact.emp_id = Company.emp_id
	INNER JOIN Demographics ON Emp_Contact.emp_id = Demographics.emp_id
	INNER JOIN Time_Entry ON Emp_Contact.emp_id = Time_Entry.emp_id
	LEFT OUTER JOIN  REF_Day_Length ON Demographics.Day_Length_ID = REF_Day_Length.Day_Length_ID
     AND Demographics.Effective_To IS NULL
    WHERE (company.company != 9)<cfif NOT listcontainsnoCase(attributes.form_Pin,"ALL" )> AND (Emp_Contact.emp_id IN (#PreserveSingleQuotes(attributes.form_Pin)#))</cfif>
ORDER BY lname 
--->
</cfif>
</cfquery>
</cfsilent>

