
<!--report/qry_undertime_Report_name.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that gets the people for the undertime report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

<cfquery name="get_name" datasource="#application.datasources.main#">
SELECT Emp_Contact.Name, Emp_Contact.LName, REF_Employee_Classification.employee_classification, 
    Emp_Contact.emp_id AS pin, SUM(Time_Entry.Hours) AS Total_hours
FROM Emp_Contact
	INNER JOIN Time_Entry ON Emp_Contact.emp_id = Time_Entry.emp_id
	INNER JOIN Demographics ON Emp_Contact.emp_id = Demographics.emp_id
	INNER JOIN Security ON Emp_Contact.emp_id = Security.emp_id
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id = Link_Company_Emp_Contact.emp_id
	INNER JOIN REF_Company ON Link_Company_Emp_Contact.company_id = REF_Company.company_id
	INNER JOIN Security_Company_Access ON Emp_Contact.emp_id = Security_Company_Access.emp_id
	LEFT OUTER JOIN REF_Employee_Classification ON Demographics.employee_classification_id = REF_Employee_Classification.employee_classification_id
WHERE Security.disable <> 1
	AND Time_Entry.active_ind=1
	AND Time_entry.date>='#start_date#'<!--- $issue$: shouldn't this be BETWEEN? --->
	AND Time_entry.date<='#end_Date#'
	AND Demographics.overtime =1 <cfif comparenocase(attributes.pin, "all")>
	AND Emp_Contact.emp_id IN (#attributes.pin#)<cfelse>
	AND Security_Company_Access.company_id IN (#session.workstream_selected_company_id#)</cfif>
GROUP BY Emp_Contact.Name, Emp_Contact.LName, REF_Employee_Classification.employee_classification,
	Emp_Contact.emp_id
</cfquery>
</cfsilent>
