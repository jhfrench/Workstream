
<!--workstream/qry_overtime_names.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the output of the overtime report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

<cfquery name="get_name" datasource="#application.datasources.main#"> 
SELECT Emp_Contact.name, Emp_Contact.lname, SUM(Time_Entry.Hours) AS hours, 
    REF_Employee_Classification.employee_classification, Demographics.pin
FROM Emp_Contact
	INNER JOIN Time_Entry ON Emp_Contact.emp_id=Time_Entry.emp_id
	INNER JOIN Demographics ON Emp_Contact.emp_id=Demographics.emp_id
	INNER JOIN REF_Employee_Classification ON Demographics.employee_classification_id = REF_Employee_Classification.employee_classification_id
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
WHERE Time_Entry.active_ind=1
	AND Time_Entry.work_date >= '#start_date#'
	AND Time_Entry.work_date <= '#end_date#'
	AND (Demographics.Overtime = 1)
	 		AND
     		((REF_Employee_Classification.employee_classification_id!=4) OR
    			(REF_Employee_Classification.employee_classification_id!=1))
			AND (Link_Company_Emp_Contact.company_id IN(#session.workstream_selected_company_id#))
		<cfif listcontains(attributes.pin, "ALL") NEQ 1> 
			AND Emp_contact.emp_id IN (#preservesinglequotes(attributes.pin)#) 
		</cfif>
GROUP BY Emp_Contact.Name, Emp_Contact.lname, 
    REF_Employee_Classification.employee_classification, Demographics.pin
HAVING (SUM(Time_entry.hours) > '40') 
</cfquery>
</cfsilent>
