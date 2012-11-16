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
SELECT COALESCE(REF_Employee_Classification.employee_classification, 'Unknown') AS employee_classification, Demographics.first_name, Demographics.last_name,
	COALESCE(Location.city, 'Unknown') AS city,
	SUM(CASE WHEN Project.billable_type_id=2 THEN Time_Entry.hours ELSE 0 END) AS non_billable, 
	SUM(CASE WHEN Project.billable_type_id!=2 THEN Time_Entry.hours ELSE 0 END) AS billable,
	Demographics.user_account_id, COALESCE(SUM(Time_Entry.hours), 0) AS gross_hours
FROM Employee
	INNER JOIN Demographics ON Demographics.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	LEFT OUTER JOIN Time_Entry ON Employee.user_account_id=Time_Entry.user_account_id
		AND Time_Entry.active_ind=1
		AND Time_Entry.work_date BETWEEN #createodbcdate(attributes.from_date)# AND #createodbcdate(attributes.to_date)#
	LEFT OUTER JOIN Project	ON Time_Entry.project_id=Project.project_id
	LEFT OUTER JOIN Location ON Demographics.user_account_id=Location.user_account_id
		AND Location.location_type_id=1<cfif NOT listfind(display_office,"ALL")>
		<!--- Need to qualify the list of locations with single quotes since its a string value --->
		AND Location.City IN (#ListQualify(display_office,"'",",","ALL")#) </cfif>
	LEFT OUTER JOIN REF_Employee_Classification ON REF_Employee_Classification.employee_classification_id=Employee.employee_classification_id
WHERE Employee.active_ind=1
	AND Employee.hire_date <= #createodbcdate(attributes.to_date)#
	AND (Employee.turnover_date >= #createodbcdate(attributes.from_date)#
		OR Employee.turnover_date IS NULL
	)
	AND Employee.user_account_id IN (#attributes.display_person#)
GROUP BY REF_Employee_Classification.employee_classification, Demographics.first_name, Demographics.last_name,
	Location.city,
	Demographics.user_account_id, Employee.employee_classification_id
ORDER BY #sort_by#
</cfquery>
</cfsilent>
