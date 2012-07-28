
<!--Report/qry_get_employee_info.cfm
	Author: Joshua Peters  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I grab the data for the HR data report
	||
	Name: Joshua Peters
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfif NOT len(attributes.start_date)>
	<cfset attributes.start_date=dateadd("yyyy",-1,now())>
</cfif>

<cfquery name="get_employee_info" datasource="#application.datasources.main#">
SELECT REF_Merit_Pool.description AS merit_pool, REF_Department.department_name, REF_Employee_Classification.employee_classification, 
	Demographics.Overtime, Emp_Contact.LName || ', ' || Emp_Contact.Name AS employee, Demographics.dob, 
	Demographics.hire_date, Demographics.end_date, Demographics.Reason_ID,
	Job_Title.title, Job_Title.date_start, Supervisor.LName || ', ' || Supervisor.Name AS supervisor,
	Performance_Review.rating, Performance_Review.created_date, Salary1.salary, 
	Salary1.date_implemented, Salary1.salary_change_type, Salary1.increase_amount,
	Salary1.increase_percent,
	DATEADD(d, 30, CAST(EXTRACT(MONTH FROM Demographics.hire_date)+1 AS varchar(2)) || '/1/' || CAST(EXTRACT(YEAR FROM Demographics.hire_date) AS varchar(4))) AS benefit_start_date,--the first of the month following hire date, plus thirty days
	REF_Company.description AS company, Office.city
FROM Link_Company_Emp_Contact
	INNER JOIN Demographics ON Demographics.emp_id=Emp_Contact.emp_id
	INNER JOIN Emp_Contact ON Link_Company_Emp_Contact.emp_id=Emp_Contact.emp_id
	INNER JOIN REF_Company ON Link_Company_Emp_Contact.company_id=REF_Company.company_id
	LEFT OUTER JOIN (
			SELECT Salary.*, REF_Salary_Change_Type.description AS salary_change_type
			FROM Salary, REF_Salary_Change_Type
			WHERE REF_Salary_Change_Type.salary_change_type_id=Salary.salary_change_type_id
				AND #createodbcdate(attributes.start_date)# BETWEEN Salary.date_implemented AND COALESCE(Salary.date_through,CURRENT_TIMESTAMP)/*Get salary as of specified date*/
		) AS Salary1 ON Emp_Contact.emp_id=Salary1.emp_id 
	LEFT OUTER JOIN Link_Employee_Supervisor
		ON Emp_Contact.emp_id=Link_Employee_Supervisor.user_account_id
	LEFT OUTER JOIN Emp_Contact Supervisor
		ON Link_Employee_Supervisor.supervisor_id=Supervisor.user_account_id
	LEFT OUTER JOIN (SELECT Source_Data.emp_id, Source_Data.rating, Source_Data.created_date
		FROM Performance_Review AS Source_Data,
			(SELECT emp_id, MAX(created_date) AS created_date
			FROM Performance_Review
			WHERE created_date < #createodbcdate(attributes.start_date)#
			GROUP BY emp_id) AS Latest
		WHERE Source_Data.emp_id=Latest.emp_id
			AND Source_Data.created_date=Latest.created_date
			) AS Performance_Review 
		ON Emp_Contact.emp_id=Performance_Review.emp_id 
	LEFT OUTER JOIN (SELECT emp_id, title, date_start FROM Job_Title WHERE #createodbcdate(attributes.start_date)# BETWEEN Job_Title.date_start AND COALESCE(Job_Title.date_end, CURRENT_TIMESTAMP)) AS Job_Title
		ON Emp_Contact.emp_id=Job_Title.emp_id 
	LEFT OUTER JOIN REF_Employee_Classification 
		ON Demographics.employee_classification_id=REF_Employee_Classification.employee_classification_id
	LEFT OUTER JOIN REF_Department 
		ON Demographics.DOB=REF_Department.department_id
	LEFT OUTER JOIN REF_Merit_Pool 
		ON Demographics.merit_pool_id=REF_Merit_Pool.merit_pool_id
	LEFT OUTER JOIN (SELECT emp_id, city FROM Location WHERE location_type_id=1) AS Office
		ON Emp_Contact.emp_id=Office.emp_id
WHERE #createodbcdate(attributes.start_date)# BETWEEN Demographics.hire_date AND COALESCE(Demographics.end_date,CURRENT_TIMESTAMP)--Get only employees active as of specified date
	AND #createodbcdate(attributes.start_date)# BETWEEN Link_Employee_Supervisor.date_start AND COALESCE(Link_Employee_Supervisor.date_end ,CURRENT_TIMESTAMP)--Get supervisor as of specified date
	AND Link_Company_Emp_Contact.company_id IN (<cfif listlen(session.workstream_selected_company_id)>#session.workstream_selected_company_id#<cfelse>0</cfif>)
ORDER BY Emp_Contact.LName, Emp_Contact.Name
</cfquery>

