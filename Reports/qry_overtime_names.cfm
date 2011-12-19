
<!--workstream/qry_overtime_names.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the output of the overtime report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:14:31  stetzer
<>

Revision 1.1  2001-10-11 11:03:52-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

<cfquery name="get_name" datasource="#application.datasources.main#">          
SELECT Emp_Contact.Name, Emp_Contact.LName, 
    SUM(Time_Entry.Hours) AS hours, 
    REF_Employee_Classification.employee_classification, 
    Demographics.pin
FROM Emp_Contact
	INNER JOIN Time_Entry ON Emp_Contact.emp_id = Time_Entry.emp_id
	INNER JOIN Demographics ON Emp_Contact.emp_id = Demographics.emp_id
	INNER JOIN REF_Employee_Classification ON Demographics.employee_classification_id = REF_Employee_Classification.employee_classification_id
    
	INNER JOIN Company ON Emp_Contact.emp_id = Company.emp_id
WHERE (Time_Entry.Date >= '#start_date#')
	AND (Time_Entry.Date <= '#end_date#')
	AND (Demographics.Overtime = 1)
	 		AND
     		((REF_Employee_Classification.employee_classification_id <> 4) OR
    			(REF_Employee_Classification.employee_classification_id <> 1))
			AND (company.company IN(#session.workstream_company_select_list#))
		<cfif listcontains(attributes.pin, "ALL") NEQ 1> 
			AND Emp_contact.emp_id IN (#PreserveSingleQuotes(attributes.pin)#) 
		</cfif>
	GROUP BY Emp_Contact.Name, Emp_Contact.LName, 
    REF_Employee_Classification.employee_classification, Demographics.pin
    HAVING (SUM(Time_entry.hours) > '40') 
</cfquery>	
</cfsilent>
