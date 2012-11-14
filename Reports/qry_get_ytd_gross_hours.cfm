<!--reports/qry_get_ytd_gross_hours.cfm
	Author: Joshua Peters -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that gets the column values for display on the Gross Hours YTD Report.
	||
	Name: Joshua Peters
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfif listcontainsnocase(attributes.display_person, "ALL")>
	<!--- If the user has selected all, remove it from the list, the user_account_id will still remain for query --->
	<cfset attributes.display_person=listdeleteat(attributes.display_person, 1,",")>
</cfif>
<cfquery name="qry_get_ytd_gross_hours" datasource="#application.datasources.main#">
SELECT COALESCE(employee_classification, 'Unknown') AS employee_classification, Demographics.first_name, Demographics.last_name,
	COALESCE(Location.city, 'Unknown') AS city,
	SUM(CASE WHEN Project.billable_type_id=2 THEN Time_Entry.hours ELSE 0 END) AS non_billable, 
	SUM(CASE WHEN Project.billable_type_id!=2 THEN Time_Entry.hours ELSE 0 END) AS billable,
	Demographics.user_account_id, COALESCE(SUM(Time_Entry.hours), 0) AS gross_hours
FROM Time_Entry
	RIGHT OUTER JOIN View_Demographics_Workstream AS Demographics ON Time_Entry.user_account_id=Demographics.user_account_id
	INNER JOIN Demographics ON Demographics.user_account_id= Demographics.user_account_id
	LEFT OUTER JOIN Project	ON Time_Entry.project_id=Project.project_id
	LEFT OUTER JOIN Location ON Demographics.user_account_id=Location.user_account_id
		AND Location.location_type_id=1<cfif NOT listfind(display_office,"ALL")>
		<!--- Need to qualify the list of locations with single quotes since its a string value --->
		AND Location.City IN (#ListQualify(display_office,"'",",","ALL")#) </cfif>
	LEFT OUTER JOIN REF_Employee_Classification ON REF_Employee_Classification.employee_classification_id=Demographics.employee_classification_id
WHERE Time_Entry.active_ind=1
	AND Time_Entry.work_date BETWEEN #createodbcdate(attributes.from_date)# AND #createodbcdate(attributes.to_date)#
	AND (
		Demographics.hire_date <= #createodbcdate(attributes.to_date)#
		AND Demographics.effective_to >= #createodbcdate(attributes.from_date)#
		OR (
			Demographics.effective_to IS NULL
			AND Demographics.hire_date  <= #createodbcdate(attributes.to_date)#)
		)
--Something wrong?
	AND Demographics.user_account_id IN (#attributes.display_person#)
GROUP BY employee_classification, Demographics.user_account_id, Demographics.employee_classification_id,
	Demographics.first_name, Demographics.last_name, Location.city 
ORDER BY #sort_by#
</cfquery>
</cfsilent>
