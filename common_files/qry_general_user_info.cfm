
<!--qry_general_user_info.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve tasks from the timekeeping database based on the environment and needs of the user.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasource.main: string that contains the name of the datasource as mapped in CF administrator
	<-- company_id: id that identifies company of the user to workstream
	<-- company_name: string that conatins company name of the user
	<-- emp_id: id that identifies user to workstream
	<-- first_name: string that contains first name of the user
	<-- last_name: string that contains last name of the user
	<-- last_updated: date that indicates the last time a user's account was modified; useful for navigation query caching
	<-- PTO_Accrual_Type_ID: This is tells workstream what type of PTO accrual you have, Lump sum or incremental
	<-- alternate_datasource: Use this if we need to have an additional datasource for this company.
 --->
<cfif isdefined("session.user_name") AND len(session.user_name)>
	<cfset variables.authorized_user=session.user_name>
<cfelse>
	<cfset variables.authorized_user="">
</cfif>
<cfquery name="general_user_info" datasource="#application.datasources.main#">
SELECT ISNULL(REF_Companies.show_hours_data_ind,0) AS show_hours_data_ind, REF_Companies.pto_accrual_type_id AS pto_accrual_type_id, REF_Companies.display_chat AS display_chat,
	REF_Companies.company_id AS company_id, REF_Companies.company AS company_name, REF_Companies.alternate_datasource,
	Emp_Contact.emp_id AS emp_id, Emp_Contact.name AS first_name, Emp_Contact.lname AS last_name,
	Emp_Contact.emp_contact_type, Security.last_updated AS last_updated, ISNULL(Security.user_level, 0) AS user_level
FROM Company, REF_Companies, Emp_Contact, Security
WHERE Company.emp_id=Emp_Contact.emp_id
	AND Emp_Contact.emp_id=Security.emp_id 
	AND Company.company=REF_Companies.company_id
	AND Security.disable=0
	AND Security.username='#variables.authorized_user#'
</cfquery>
</cfsilent>
