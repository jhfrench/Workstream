
<!--Reports/qry_gross_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the gross hours report.
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.date_open=createodbcdate("#attributes.month#/1/#attributes.year#")>
<cfset variables.date_closed=createodbcdate("#attributes.month#/#daysinmonth(variables.date_open)#/#attributes.year#")>
<cfquery name="get_gross_hours" datasource="#application.datasources.main#">
SELECT (Emp_Contact.lname || ', ' || Emp_Contact.name) AS name,<cfloop from="1" to="#variables.daysinmonth#" index="ii">
	SUM(CASE WHEN EXTRACT(DAY FROM Time_Entry.work_date)=#ii# THEN Time_Entry.hours ELSE 0 END) AS day#ii#,</cfloop>
	SUM(CASE WHEN Time_Entry.work_date IS NOT NULL THEN Time_Entry.hours ELSE 0 END) AS total
FROM Emp_Contact
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
		AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
	INNER JOIN Demographics_Ngauge ON Emp_Contact.emp_id=Demographics_Ngauge.emp_id
		AND Demographics.effective_from <= #variables.date_closed#
		AND COALESCE(Demographics.effective_to,#variables.date_open#) >= #variables.date_open#
	LEFT OUTER JOIN Location ON Emp_Contact.emp_id=Location.emp_id
		AND Location.location_type_id=1
	LEFT OUTER JOIN Time_Entry ON Emp_Contact.emp_id=Time_Entry.emp_id
		AND Time_Entry.active_ind=1
		AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.month#
		AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.year#
WHERE 1=1<cfif isdefined("attributes.emp_id") AND attributes.emp_id NEQ "ALL">
	AND Emp_Contact.emp_id=#attributes.emp_id#</cfif><cfif isdefined("attributes.office_location") AND attributes.office_location NEQ "ALL">
	AND Location.city='#attributes.office_location#'</cfif>
GROUP BY lname, name
ORDER BY name
</cfquery>
</cfsilent>

<cfquery name="get_gross_hours_total" dbtype="query">
SELECT <cfloop from="1" to="#variables.daysinmonth#" index="ii">
	SUM(day#ii#) AS day#ii#,</cfloop>
	SUM(total) AS total
FROM get_gross_hours
</cfquery>
