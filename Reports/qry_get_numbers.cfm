
<!--Reports/qry_get_numbers.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I query out the population and total count of separations (grouped by separation type, quarter, and year) for a given company.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	<-- #reason_desc#: string that contains variable--name of variable is populated from REF_separation_reason table
	<-- pop: total number of employees employed within a given quarter
	<-- theyear: year data reflects
	<-- thequarter: quarter data reflects
	END FUSEDOC --->
<cfset query_name="Get_Numbers">
<cfset date_start="1/1/1999">
<cfquery name="#query_name#" datasource="#application.datasources.main#">
SELECT SUM(CASE WHEN Demographics.hire_date <= date_end AND (Demographics.end_date >= date_start OR Demographics.end_date IS NULL) THEN 1 ELSE 0 END) AS pop,
	<cfloop query="Get_Reasons">SUM(CASE WHEN turnover.reason_id = #reason_id# AND (Demographics.end_date <= date_end AND Demographics.end_date >= date_start) THEN 1 ELSE 0 END) AS #separation_reason#,</cfloop>
	thequarter, theyear
FROM ABCD_Quarter, Demographics_Ngauge Demographics, Company,  Turnover
WHERE Turnover.demographics_id =* Demographics.demographics_id 
	AND Company.emp_id = Demographics.emp_id 
	AND company IN (#session.workstream_company_select_list#) and hire_date IS NOT NULL  and date_start >= '#date_start#' 
	AND date_end <= DATEADD(qq,1,  GETDATE())
GROUP BY thequarter, theyear
ORDER BY theyear, thequarter
</cfquery>
<cfquery name="total_population" datasource="#application.datasources.main#">
SELECT COUNT(Emp_Contact.emp_id) AS total_pop
FROM Emp_Contact, Company, Demographics_Ngauge Demographics
WHERE Emp_Contact.emp_id=Company.emp_id
	AND Emp_Contact.emp_id = Demographics.emp_id
	AND Company.Company IN (#session.workstream_company_select_list#) 
	AND Demographics.Hire_Date IS NOT NULL
	AND (Demographics.End_Date <= DATEADD(qq, 1, GETDATE()) 
		OR Demographics.End_Date IS NULL)
	AND Hire_Date >= #createodbcdatetime(date_start)#
</cfquery>
</cfsilent>

