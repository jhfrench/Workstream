
<!--reports/qry_gross_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the gross hours report.

	||
	Edits:
	$Log$
	Revision 1.2  2005/11/21 19:25:55  french
	Added ability to sort by last name, with TOTAL row coming last. Task 37703

	||
	END FUSEDOC --->
<cfset variables.date_open=createodbcdate("#attributes.month#/1/#attributes.year#")>
<cfset variables.date_closed=createodbcdate("#attributes.month#/#daysinmonth(variables.date_open)#/#attributes.year#")>
<cfquery name="gross_hours" datasource="#application.datasources.main#">	
SELECT 1 AS overall_order, (Emp_Contact.lname+', '+Emp_Contact.name) AS name,<cfloop from="1" to="#variables.daysinmonth#" index="ii">
	SUM(CASE WHEN DAY(Time_Entry.date)=#ii# THEN Time_Entry.hours ELSE 0 END) AS [day#ii#],</cfloop>
	SUM(CASE WHEN Time_Entry.date IS NOT NULL THEN Time_Entry.hours ELSE 0 END) AS total
FROM Emp_Contact, Time_Entry, Link_Emp_Contact_Employer,
	Demographics_Ngauge Demographics<cfif isdefined("attributes.office_location") AND attributes.office_location NEQ "ALL">, Location</cfif>
WHERE Emp_Contact.emp_id=Demographics.emp_id
	AND Emp_Contact.emp_id=Time_Entry.emp_id
	AND Emp_Contact.emp_id=Link_Emp_Contact_Employer.emp_id
	AND Demographics.effective_from <= #variables.date_closed#
	AND Time_Entry.date BETWEEN Demographics.effective_from AND ISNULL(Demographics.effective_to, Time_Entry.date)
	AND ISNULL(Demographics.effective_to,#variables.date_open#) >= #variables.date_open#
	AND MONTH(Time_Entry.date)=#attributes.month#
	AND YEAR(Time_Entry.date)=#attributes.year#
	AND Link_Emp_Contact_Employer.company_id IN (#session.workstream_selected_company_id#)
<cfif isdefined("attributes.emp_id") AND attributes.emp_id NEQ "ALL">
	AND Emp_Contact.emp_id=#attributes.emp_id#
</cfif>
<cfif isdefined("attributes.office_location") AND attributes.office_location NEQ "ALL">
	AND Emp_Contact.emp_id=Location.emp_id
	AND Location.location_type_id=1
	AND Location.city='#attributes.office_location#'
</cfif>
GROUP BY lname, name 
UNION ALL
SELECT 2 AS overall_order, 'Total' AS name,<cfloop from="1" to="#variables.daysinmonth#" index="ii">
	SUM(CASE WHEN DAY(Time_Entry.date)=#ii# THEN Time_Entry.hours ELSE 0 END) AS [day#ii#],</cfloop>
	SUM(CASE WHEN Time_Entry.date IS NOT NULL THEN Time_Entry.hours ELSE 0 END) AS total
FROM Emp_Contact, Time_Entry, Link_Emp_Contact_Employer,
	Demographics_Ngauge Demographics<cfif isdefined("attributes.office_location") AND attributes.office_location NEQ "ALL">, Location</cfif>
WHERE Emp_Contact.emp_id=Demographics.emp_id
	AND Emp_Contact.emp_id=Time_Entry.emp_id
	AND Emp_Contact.emp_id=Link_Emp_Contact_Employer.emp_id
	AND Demographics.effective_from <= #variables.date_closed#
	AND Time_Entry.date BETWEEN Demographics.effective_from AND ISNULL(Demographics.effective_to, Time_Entry.date)
	AND ISNULL(Demographics.effective_to,#variables.date_open#) >= #variables.date_open#
	AND MONTH(Time_Entry.date)=#attributes.month#
	AND YEAR(Time_Entry.date)=#attributes.year#
	AND Link_Emp_Contact_Employer.company_id IN (#session.workstream_selected_company_id#)
<cfif isdefined("attributes.emp_id") AND attributes.emp_id NEQ "ALL">
	AND Emp_Contact.emp_id=#attributes.emp_id#
</cfif>
<cfif isdefined("attributes.office_location") AND attributes.office_location NEQ "ALL">
	AND Emp_Contact.emp_id=Location.emp_id
	AND Location.location_type_id=1
	AND Location.city='#attributes.office_location#'
</cfif>
ORDER BY overall_order, name
</cfquery>
</cfsilent>

