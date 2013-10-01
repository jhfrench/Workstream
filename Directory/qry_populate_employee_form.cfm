
<!-- Directory/qry_populate_employee_form.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I run the queries and set the variables that the edit employee
	form needs to prepopulate the form with the employee's information.

	||
	Edits:
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="populate_employee_form" datasource="#application.datasources.main#">
SELECT Demographics.first_name, Demographics.last_name, Demographics.credentials,
	Demographics.middle_initial, User_Account.account_type_id,
	Demographics.uupic, Employee.hire_date, Employee.birth_date,
	Employee.photo_path, Employee.employee_classification_id,
	work_loc.Address1 AS address1_1, work_loc.Address2 AS address2_1, work_loc.City AS city_1,
	work_loc.State AS state_1, work_loc.Zip AS zip_1,
	home_loc.Address1 AS address1_2, home_loc.Address2 AS address2_2, home_loc.City AS city_2,
	home_loc.State AS state_2, home_loc.Zip AS zip_2,
	work_email.email AS email_1, home_email.email AS email_2, pager_email.email AS email_3,
	work_phone.Phone_Number AS phone_1, work_phone.Extension AS phone_1_ext, home_phone.Phone_Number AS phone_2,
	home_phone.Extension AS phone_2_ext, fax_phone.Phone_Number AS phone_3, fax_phone.Extension AS phone_3_ext,
	cell_phone.Phone_Number AS phone_4, cell_phone.Extension AS phone_4_ext, pager_phone.Phone_Number AS phone_5,
	pager_phone.Extension AS phone_5_ext, Emp_Biography.biography
FROM Employee
	INNER JOIN Demographics ON Employee.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	LEFT OUTER JOIN User_Account ON Demographics.user_account_id=User_Account.user_account_id
	LEFT OUTER JOIN Emp_Biography ON Employee.user_account_id=Emp_Biography.user_account_id
		AND Emp_Biography.active_ind=1
	LEFT OUTER JOIN (
		SELECT *
		FROM phone
		WHERE phone_type_id=5
	) AS pager_phone ON Employee.user_account_id=pager_phone.user_account_id
	LEFT OUTER JOIN (
		SELECT *
		FROM email
		WHERE email_type_id=2
	) AS Home_Email ON Employee.user_account_id=home_email.user_account_id
	LEFT OUTER JOIN (
		SELECT *
		FROM email
		WHERE email_type_id=3
	) AS pager_email ON Employee.user_account_id=pager_email.user_account_id
	LEFT OUTER JOIN (
		SELECT *
		FROM phone
		WHERE phone_type_id=1
	) AS work_phone ON Employee.user_account_id=work_phone.user_account_id
	LEFT OUTER JOIN(
		SELECT *
		FROM phone
		WHERE phone_type_id=2
	) AS home_phone ON Employee.user_account_id=home_phone.user_account_id
	LEFT OUTER JOIN(
		SELECT *
		FROM phone
		WHERE phone_type_id=3
	) AS fax_phone ON Employee.user_account_id=fax_phone.user_account_id
	LEFT OUTER JOIN(
		SELECT *
		FROM phone
		WHERE phone_type_id=4
	) AS cell_phone ON Employee.user_account_id=cell_phone.user_account_id
	LEFT OUTER JOIN(
		SELECT *
		FROM email
		WHERE email_type_id=1
	) AS work_email ON Employee.user_account_id=work_email.user_account_id
	LEFT OUTER JOIN(
		SELECT *
		FROM location
		WHERE location_type_id=1
	) AS work_loc ON Employee.user_account_id=work_loc.user_account_id
	LEFT OUTER JOIN(
		SELECT *
		FROM location WHERE location_type_id=2
	) AS home_loc ON Employee.user_account_id=home_loc.user_account_id
WHERE Employee.active_ind=1
	AND Employee.user_account_id=<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" />
</cfquery>
<cfscript>
	variables.address1_1=populate_employee_form.address1_1;
	variables.address2_1=populate_employee_form.address2_1;
	variables.city_1=populate_employee_form.city_1;
	variables.state_1=populate_employee_form.state_1;
	variables.zip_1=populate_employee_form.zip_1;
	variables.address1_2=populate_employee_form.address1_2;
	variables.address2_2=populate_employee_form.address2_2;
	variables.city_2=populate_employee_form.city_2;
	variables.state_2=populate_employee_form.state_2;
	variables.zip_2=populate_employee_form.zip_2;
	variables.email_1=populate_employee_form.email_1;
	variables.email_2=populate_employee_form.email_2;
	variables.phone_1=populate_employee_form.phone_1;
	variables.phone_1_ext=populate_employee_form.phone_1_ext;
	variables.phone_2=populate_employee_form.phone_2;
	variables.phone_2_ext=populate_employee_form.phone_2_ext;
	variables.phone_3=populate_employee_form.phone_3;
	variables.phone_3_ext=populate_employee_form.phone_3_ext;
	variables.phone_4=populate_employee_form.phone_4;
	variables.phone_4_ext=populate_employee_form.phone_4_ext;
	variables.phone_5=populate_employee_form.phone_5;
	variables.phone_5_ext=populate_employee_form.phone_5_ext;
	variables.email_3=populate_employee_form.email_3;
</cfscript>

<cfquery name="get_security_company_access" datasource="#application.datasources.main#">
SELECT company_id
FROM Security_Company_Access
WHERE user_account_id=<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" />
</cfquery>
<cfset attributes.visible_company_id=valuelist(get_security_company_access.company_id)>

<cfquery name="get_supervisors" datasource="#application.datasources.main#">
SELECT supervisor_id
FROM Link_User_Account_Supervisor
WHERE user_account_id=<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" />
	AND active_ind=1
</cfquery>
<cfset supervisor_id=valuelist(get_supervisors.supervisor_id)>
</cfsilent>