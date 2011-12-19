
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
SELECT ec.Name, ec.LName, ec.Credentials, ec.MI, 
	ec.Emp_contact_Type, d.Employee_Type_ID, d.SSN, d.pin, d.Hire_Date, d.DOB, 
	d.Manager_non_id, d.Photo, d.employee_classification_ID, 
	work_loc.Address1 AS address1_1, 
	work_loc.Address2 AS address2_1, work_loc.City AS city_1, 
	work_loc.State AS state_1, work_loc.Zip AS zip_1, 
	home_loc.Address1 AS address1_2, 
	home_loc.Address2 AS address2_2, home_loc.City AS city_2, 
	home_loc.State AS state_2, home_loc.Zip AS zip_2, 
	work_email.Email AS email_1, home_email.Email AS email_2, 
	pager_email.email as email_3,
	work_phone.Phone_Number AS phone_1, 
	work_phone.Extension AS phone_1_ext, 
	home_phone.Phone_Number AS phone_2, 
	home_phone.Extension AS phone_2_ext, 
	fax_phone.Phone_Number AS phone_3, 
	fax_phone.Extension AS phone_3_ext, 
	cell_phone.Phone_Number AS phone_4, 
	cell_phone.Extension AS phone_4_ext, 
	pager_phone.Phone_Number AS phone_5, 
	pager_phone.Extension AS phone_5_ext, 
	Emp_Biography.biography
FROM Emp_Contact ec
	INNER JOIN Demographics_Ngauge d ON ec.Emp_ID = d.Emp_ID
	LEFT OUTER JOIN Emp_Biography ON ec.Emp_ID = Emp_Biography.emp_id
	LEFT OUTER JOIN (
		SELECT *
		FROM phone
		WHERE phone_type_id = 5
	) AS pager_phone ON  ec.Emp_ID = pager_phone.Emp_ID
	LEFT OUTER JOIN (
		SELECT *
		FROM email
		WHERE email_type_id = 2
	) AS Home_Email ON ec.Emp_ID = home_email.Emp_ID
	LEFT OUTER JOIN (
		SELECT *
		FROM email
		WHERE email_type_id = 3
	) pager_email ON ec.Emp_ID = pager_email.Emp_ID
	LEFT OUTER JOIN (
		SELECT *
		FROM phone
		WHERE phone_type_id = 1
	) AS work_phone ON ec.Emp_ID = work_phone.Emp_ID
	LEFT OUTER JOIN(
		SELECT *
		FROM phone
		WHERE phone_type_id = 2
	) home_phone ON ec.Emp_ID = home_phone.Emp_ID
	LEFT OUTER JOIN(
		SELECT *
		FROM phone
		WHERE phone_type_id = 3
	) fax_phone ON ec.Emp_ID = fax_phone.Emp_ID
	LEFT OUTER JOIN(
		SELECT *
		FROM phone
		WHERE phone_type_id = 4
	) cell_phone ON ec.Emp_ID = cell_phone.Emp_ID
	LEFT OUTER JOIN(
		SELECT *
		FROM email
		WHERE email_type_id = 1
	) work_email ON ec.Emp_ID = work_email.Emp_ID
	LEFT OUTER JOIN(
		SELECT *
		FROM location
		WHERE location_type_id = 1
	) work_loc ON ec.Emp_ID = work_loc.Emp_ID
	LEFT OUTER JOIN(
		SELECT *
		FROM location WHERE location_type_id = 2
	) home_loc ON ec.Emp_ID = home_loc.Emp_ID
WHERE d.Effective_To IS NULL
	AND ec.Emp_ID = #attributes.emp_id#
</cfquery>
<cfoutput query="populate_employee_form">
	<cfset address1_1 = address1_1>
	<cfset address2_1 =address2_1>
	<cfset city_1 = city_1>
	<cfset state_1 = state_1> 
	<cfset zip_1 = zip_1> 
	<cfset address1_2 = address1_2>
	<cfset address2_2 = address2_2>
	<cfset city_2 = city_2>
	<cfset state_2 = state_2> 
	<cfset zip_2 = zip_2> 
	<cfset email_1 = email_1> 
	<cfset email_2 = email_2>
	<cfset phone_1 = phone_1> 
	<cfset phone_1_ext = phone_1_ext>
	<cfset phone_2 = phone_2> 
	<cfset phone_2_ext = phone_2_ext> 
	<cfset phone_3 = phone_3> 
	<cfset phone_3_ext = phone_3_ext>
	<cfset phone_4  = phone_4> 
	<cfset phone_4_ext = phone_4_ext> 
	<cfset phone_5 = phone_5> 
	<cfset phone_5_ext = phone_5_ext> 
	<cfset email_3 = email_3> 
</cfoutput>
 	<cfquery name="get_product_access" datasource="#application.datasources.main#">
    SELECT product_name
    FROM security_product_access inner join  REF_product 
	ON  REF_product.product_id = security_product_access.product_id
    WHERE emp_id = #attributes.emp_id#
    </cfquery>  
	<cfif ListFindNoCase(ValueList(get_product_access.product_name), "workstream")>
		<cfset workstream = "1">
	</cfif>
	<cfquery name="get_visible_companies" datasource="#application.datasources.main#">
    SELECT company_id
    FROM company_visible_to
    WHERE emp_id = #attributes.emp_id#
    </cfquery>
	<cfset visable_company = valuelist(get_visible_companies.company_id)>
	<cfquery name="get_supervisors" datasource="#application.datasources.main#">
    SELECT supervisor_id
    FROM  Link_Employee_Supervisor
    WHERE emp_id = #attributes.emp_id#
	AND active_ind = 1
    </cfquery>
	<cfset supervisor_id = valuelist(get_supervisors.supervisor_id)>
</cfsilent>
