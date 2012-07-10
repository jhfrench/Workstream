
<!--Tools/qry_get_extreme_dates.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the date for the earliest and latest time entries for all companies that the user is allowed to see, and the difference, in months, between them.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	END FUSEDOC --->
<cfquery name="get_extreme_dates" datasource="#application.datasources.main#">
SELECT MIN(Time_Entry.date) AS min_date, MAX(Time_Entry.date) AS max_date, 
	DATEDIFF(m, MIN(Time_Entry.date), MAX(Time_Entry.date)) AS difference
FROM Time_Entry, Link_Company_Emp_Contact
WHERE Time_Entry.emp_id=Link_Company_Emp_Contact.emp_id
	AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
</cfquery>
</cfsilent>