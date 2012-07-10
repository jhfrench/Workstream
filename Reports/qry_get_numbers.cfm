
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
SELECT SUM(CASE WHEN Demographics.hire_date <= ABCD_Quarter.date_end AND (Demographics.end_date >= ABCD_Quarter.date_start OR Demographics.end_date IS NULL) THEN 1 ELSE 0 END) AS pop,
	<cfloop query="Get_Reasons">SUM(CASE WHEN Turnover.reason_id = #reason_id# AND (Demographics.end_date <= ABCD_Quarter.date_end AND Demographics.end_date >= ABCD_Quarter.date_start) THEN 1 ELSE 0 END) AS #separation_reason#,</cfloop>
	ABCD_Quarter.thequarter, ABCD_Quarter.theyear
FROM ABCD_Quarter, Demographics_Ngauge Demographics, Link_Company_Emp_Contact,  Turnover
WHERE Turnover.demographics_id =* Demographics.demographics_id 
	AND Link_Company_Emp_Contact.emp_id = Demographics.emp_id 
	AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
	AND Demographics.hire_date IS NOT NULL  
	AND ABCD_Quarter.date_start >= '#date_start#' 
	AND ABCD_Quarter.date_end <= DATEADD(qq,1,  CURRENT_TIMESTAMP)
GROUP BY ABCD_Quarter.thequarter, ABCD_Quarter.theyear
ORDER BY ABCD_Quarter.thequarter, ABCD_Quarter.theyear
</cfquery>
<cfquery name="total_population" datasource="#application.datasources.main#">
SELECT COUNT(Emp_Contact.emp_id) AS total_pop
FROM Emp_Contact, Link_Company_Emp_Contact, Demographics_Ngauge Demographics
WHERE Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
	AND Emp_Contact.emp_id = Demographics.emp_id
	AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#) 
	AND Demographics.hire_date IS NOT NULL
	AND (Demographics.end_date <= DATEADD(qq, 1, CURRENT_TIMESTAMP) 
		OR Demographics.end_date IS NULL)
	AND Demographics.hire_date >= #createodbcdatetime(date_start)#
</cfquery>
</cfsilent>

