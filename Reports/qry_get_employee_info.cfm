
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
	Revision 1.1  2005/03/09 18:13:06  stetzer
	<>

	||
	END FUSEDOC --->
</cfsilent>
<cfif NOT len(attributes.start_date)>
	<cfset attributes.start_date=dateadd("yyyy",-1,now())>
</cfif>

<cfquery name="get_employee_info" datasource="#application.datasources.main#">
SELECT REF_Merit_Pool.description AS merit_pool, REF_Department.department_name, REF_Employee_Classification.employee_classification, 
	Demographics.Overtime, Emp_Contact.LName+', '+Emp_Contact.Name AS employee, Demographics.dob, 
	Demographics.Hire_Date, Demographics.End_Date, Demographics.Reason_ID,
	Job_Title.title, Job_Title.date_start, Supervisor.LName+', '+Supervisor.Name AS supervisor,
	Performance_Review.rating, Performance_Review.date_recorded, Salary1.salary, 
	Salary1.date_implemented, Salary1.salary_change_type, Salary1.increase_amount,
	Salary1.increase_percent,
	DATEADD(d, 30, CAST(MONTH(Demographics.Hire_Date)+1 AS VARCHAR(2))+'/1/'+CAST(YEAR(Demographics.Hire_Date) AS VARCHAR(4))) AS benefit_start_date,--the first of the month following hire date, plus thirty days
	REF_Company.Company, Office.city
FROM Company
	INNER JOIN Demographics
	INNER JOIN Emp_Contact
		ON Demographics.emp_id=Emp_Contact.emp_id
		ON Company.emp_id=Emp_Contact.emp_id
	INNER JOIN REF_Company
		ON Company.Company=REF_Company.Company_ID
	LEFT OUTER JOIN (SELECT Salary.*, REF_Salary_Change_Type.description AS salary_change_type
			FROM Salary, REF_Salary_Change_Type
			WHERE REF_Salary_Change_Type.salary_change_type_id=Salary.salary_change_type_id
				AND #createodbcdate(attributes.start_date)# BETWEEN Salary.date_implemented AND ISNULL(Salary.date_through,GETDATE())/*Get salary as of specified date*/) AS Salary1
		ON Emp_Contact.emp_id=Salary1.emp_id 
	LEFT OUTER JOIN Link_Employee_Supervisor
		ON Emp_Contact.emp_id=Link_Employee_Supervisor.emp_id
	LEFT OUTER JOIN Emp_Contact Supervisor
		ON Link_Employee_Supervisor.supervisor_id=Supervisor.emp_id
	LEFT OUTER JOIN (SELECT Source_Data.emp_id, Source_Data.rating, Source_Data.date_recorded
		FROM Performance_Review AS Source_Data,
			(SELECT emp_id, MAX(date_recorded) AS date_recorded
			FROM Performance_Review
			WHERE date_recorded < #createodbcdate(attributes.start_date)#
			GROUP BY emp_id) AS Latest
		WHERE Source_Data.emp_id=Latest.emp_id
			AND Source_Data.date_recorded=Latest.date_recorded
			) AS Performance_Review 
		ON Emp_Contact.emp_id=Performance_Review.emp_id 
	LEFT OUTER JOIN (SELECT emp_id, title, date_start FROM Job_Title WHERE #createodbcdate(attributes.start_date)# BETWEEN Job_Title.date_start AND ISNULL(Job_Title.date_end, GETDATE())) AS Job_Title
		ON Emp_Contact.emp_id=Job_Title.emp_id 
	LEFT OUTER JOIN REF_Employee_Classification 
		ON Demographics.employee_classification_id=REF_Employee_Classification.employee_classification_id
	LEFT OUTER JOIN REF_Department 
		ON Demographics.DOB=REF_Department.department_id
	LEFT OUTER JOIN REF_Merit_Pool 
		ON Demographics.merit_pool_id=REF_Merit_Pool.merit_pool_id
	LEFT OUTER JOIN (SELECT emp_id, city FROM Location WHERE location_type_id=1) AS Office
		ON Emp_Contact.emp_id=Office.emp_id
WHERE #createodbcdate(attributes.start_date)# BETWEEN Demographics.Hire_Date AND ISNULL(Demographics.End_Date,GETDATE())--Get only employees active as of specified date
	AND #createodbcdate(attributes.start_date)# BETWEEN Link_Employee_Supervisor.date_start AND ISNULL(Link_Employee_Supervisor.date_end ,GETDATE())--Get supervisor as of specified date
	AND Company.company IN (<cfif listlen(session.workstream_company_select_list)>#session.workstream_company_select_list#<cfelse>0</cfif>)
ORDER BY Emp_Contact.LName, Emp_Contact.Name
</cfquery>
	
