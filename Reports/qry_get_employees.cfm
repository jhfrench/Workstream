
<!--Reports/Qry_get_employees.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:13:04  stetzer
<>

Revision 1.1  2001-10-11 11:04:00-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	||
	END FUSEDOC --->


<cfquery name="manager" datasource="#application.datasources.main#">
SELECT ISNULL(REF_Employee_Classification.employee_classification, 'None') 
    AS employee_classification, Emp_Contact.Name, Emp_Contact.LName, 
    Demographics.pin, Demographics.Emp_ID, 
    REF_companies.Company, Security.Disable
FROM Emp_Contact INNER JOIN
    Demographics ON 
    Emp_Contact.Emp_ID = Demographics.Emp_ID INNER JOIN
    Security ON 
    Emp_Contact.Emp_ID = Security.Emp_ID INNER JOIN
    Company ON 
    Emp_Contact.Emp_ID = Company.Emp_ID INNER JOIN
    REF_companies ON 
    Company.Company = REF_companies.Company_ID INNER JOIN
    Supervisor ON 
    Emp_Contact.Emp_ID = Supervisor.Emp_ID LEFT OUTER JOIN
    REF_Employee_Classification ON 
    Demographics.employee_classification_ID = REF_Employee_Classification.employee_classification_ID
WHERE (Security.Disable <> 1) AND sup_id = #session.user_account_id# AND (
		(Demographics.effective_from <= #CreateODBCDate(variables.through_date)# AND effective_to >= #CreateODBCDate(variables.from_date)#)      
		OR (effective_to IS NULL AND effective_from  <= #CreateODBCDate(variables.through_date)#)
	)
	ORDER BY LName
</cfquery>
</cfsilent>
