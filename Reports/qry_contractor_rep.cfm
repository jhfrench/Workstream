
<!--Reports/qry_contractor_rep.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
 <cfquery name="get_Employee_ID" datasource="#application.datasources.main#">
SELECT Emp_Contact.emp_id, Emp_Contact.Name, Emp_Contact.LName,
	Demographics.pin, REF_Company.description AS company,
	CASE
		WHEN Security.Disable = 0 THEN 'Active'
		ELSE 'Inactive'
	END AS status
FROM Demographics_Ngauge AS Demographics
	INNER JOIN Emp_Contact ON Demographics.emp_id = Emp_Contact.emp_id
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id = Link_Company_Emp_Contact.emp_id
	INNER JOIN REF_Company ON Link_Company_Emp_Contact.company_id = REF_Company.company_id
	INNER JOIN Security ON Emp_Contact.emp_id = Security.emp_id
WHERE (Demographics.employee_classification_id = 4)
	AND (Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)) and Demographics.effective_to IS NULL
</cfquery>