
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
	--> session.user_account_id: number that uniquely identifies the user
 --->
<cfquery name="life_blurb" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT New_Hires.new_hires AS new_hires, Birthdays.birthdays AS birthdays, Anniversaries.anniversaries AS anniversaries, Total_Employees.total_employees AS total_employees
FROM
	(SELECT COUNT(*) AS new_hires
	FROM Demographics_Ngauge AS Demographics, Link_Emp_Contact_Employer
	WHERE Demographics.emp_id=Link_Emp_Contact_Employer.emp_id
		AND (Demographics.effective_to IS NULL OR Demographics.effective_to > GETDATE())
		AND (Demographics.end_date IS NULL OR Demographics.end_date > GETDATE())
		AND Demographics.employee_type_id!=8 /*exclude group lists from employee count*/
		AND Link_Emp_Contact_Employer.company_id=#listlast(session.workstream_company_id)#
		AND MONTH(Demographics.hire_date)=MONTH(GETDATE())
		AND YEAR(Demographics.hire_date)=YEAR(GETDATE()))
	AS New_Hires,
	(SELECT COUNT(*) AS birthdays
	FROM Demographics_Ngauge AS Demographics, Link_Emp_Contact_Employer
	WHERE Demographics.emp_id=Link_Emp_Contact_Employer.emp_id
		AND (Demographics.effective_to IS NULL OR Demographics.effective_to > GETDATE())
		AND (Demographics.end_date IS NULL OR Demographics.end_date > GETDATE())
		AND Demographics.employee_type_id!=8 /*exclude group lists from employee count*/
		AND Link_Emp_Contact_Employer.company_id=#listlast(session.workstream_company_id)#
		AND MONTH(Demographics.dob)=MONTH(GETDATE()))
	AS Birthdays,
	(SELECT COUNT(*) AS anniversaries
	FROM Demographics_Ngauge AS Demographics, Link_Emp_Contact_Employer, Emp_Contact
	WHERE Demographics.emp_id=Emp_Contact.emp_id
		AND Demographics.emp_id=Link_Emp_Contact_Employer.emp_id
		AND (Demographics.effective_to IS NULL OR Demographics.effective_to > GETDATE())
		AND (Demographics.end_date IS NULL 
			OR Demographics.end_date >= DATEADD(year,1,Demographics.hire_date))
		AND Demographics.employee_type_id!=8 /*exclude group lists from employee count*/
		AND Link_Emp_Contact_Employer.company_id=#listlast(session.workstream_company_id)#
		AND MONTH(Demographics.hire_date)=MONTH(GETDATE())
		AND YEAR(Demographics.hire_date) < YEAR(GETDATE()))
	AS Anniversaries,
	(SELECT COUNT(*) AS total_employees
	FROM Demographics_Ngauge AS Demographics, Link_Emp_Contact_Employer, Security
	WHERE Demographics.emp_id=Link_Emp_Contact_Employer.emp_id
		AND Demographics.emp_id=Security.emp_id
		AND (Demographics.effective_to IS NULL OR Demographics.effective_to > GETDATE())
		AND (Demographics.end_date IS NULL OR Demographics.end_date > GETDATE())
		AND Link_Emp_Contact_Employer.company_id=#listlast(session.workstream_company_id)#
		AND Demographics.employee_type_id!=8 /*exclude group lists from employee count*/
		AND Security.disable=0
		AND #application.team_changed#=#application.team_changed#
		AND #month(now())#=#month(now())#
		AND #year(now())#=#year(now())#)
	AS Total_Employees
</cfquery>
</cfsilent>
