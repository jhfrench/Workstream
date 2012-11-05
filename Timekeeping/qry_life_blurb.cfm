
<!--Timekeeping/qry_life_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the hours an employee worked in the last two months.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> variables.user_identification: number that uniquely identifies the user
 --->
<cfquery name="life_blurb" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT New_Hires.new_hires AS new_hires, Birthdays.birthdays AS birthdays, Anniversaries.anniversaries AS anniversaries, Total_Employees.total_employees AS total_employees
FROM
	(SELECT COUNT(*) AS new_hires
	FROM View_Demographics_Workstream AS Demographics, Link_Company_Emp_Contact
	WHERE Demographics.emp_id=Link_Company_Emp_Contact.emp_id
		AND (Demographics.effective_to IS NULL OR Demographics.effective_to > CURRENT_TIMESTAMP)
		AND Link_Company_Emp_Contact.company_id=#listlast(session.workstream_company_id)#
		AND EXTRACT(MONTH FROM Demographics.hire_date)=EXTRACT(MONTH FROM CURRENT_DATE)
		AND EXTRACT(YEAR FROM Demographics.hire_date)=EXTRACT(YEAR FROM CURRENT_DATE))
	AS New_Hires,
	(SELECT COUNT(*) AS birthdays
	FROM View_Demographics_Workstream AS Demographics, Link_Company_Emp_Contact
	WHERE Demographics.emp_id=Link_Company_Emp_Contact.emp_id
		AND (Demographics.effective_to IS NULL OR Demographics.effective_to > CURRENT_TIMESTAMP)
		AND Link_Company_Emp_Contact.company_id=#listlast(session.workstream_company_id)#
		AND EXTRACT(MONTH FROM Demographics.dob)=EXTRACT(MONTH FROM CURRENT_DATE))
	AS Birthdays,
	(SELECT COUNT(*) AS anniversaries
	FROM View_Demographics_Workstream AS Demographics, Link_Company_Emp_Contact, Emp_Contact
	WHERE Demographics.emp_id=Emp_Contact.emp_id
		AND Demographics.emp_id=Link_Company_Emp_Contact.emp_id
		AND (Demographics.effective_to IS NULL OR Demographics.effective_to > CURRENT_TIMESTAMP)
		AND Link_Company_Emp_Contact.company_id=#listlast(session.workstream_company_id)#
		AND EXTRACT(MONTH FROM Demographics.hire_date)=EXTRACT(MONTH FROM CURRENT_DATE)
		AND EXTRACT(YEAR FROM Demographics.hire_date) < EXTRACT(YEAR FROM CURRENT_DATE))
	AS Anniversaries,
	(SELECT COUNT(*) AS total_employees
	FROM View_Demographics_Workstream AS Demographics, Link_Company_Emp_Contact
	WHERE Demographics.emp_id=Link_Company_Emp_Contact.emp_id
		AND (Demographics.effective_to IS NULL OR Demographics.effective_to > CURRENT_TIMESTAMP)
		AND Link_Company_Emp_Contact.company_id=#listlast(session.workstream_company_id)#
		AND #application.team_changed#=#application.team_changed#
		AND #month(now())#=#month(now())#
		AND #year(now())#=#year(now())#)
	AS Total_Employees
</cfquery>
</cfsilent>
