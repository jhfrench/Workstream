<!--common_files/qry_general_user_info.cfm
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
	<-- pto_accrual_type_id: This is tells workstream what type of PTO accrual you have (lump sum or incremental)
	<-- alternate_datasource: Use this if we need to have an additional datasource for this company.
 --->
<cfif isdefined("session.user_account_id") AND isnumeric(session.user_account_id)>
	<cfset variables.user_account_id=session.user_account_id>
<cfelse>
	<cfset variables.authorized_user=0>
</cfif>
<cfquery name="general_user_info" datasource="#application.datasources.main#">
SELECT COALESCE(REF_Company.show_hours_data_ind,0) AS show_hours_data_ind, REF_Company.pto_accrual_type_id, REF_Company.display_chat,
	REF_Company.company_id, REF_Company.description AS company_name, REF_Company.alternate_datasource,
	Emp_Contact.emp_id, Emp_Contact.name AS first_name, Emp_Contact.lname AS last_name,
	Emp_Contact.emp_contact_type
FROM Link_Company_Emp_Contact
	INNER JOIN REF_Company ON Link_Company_Emp_Contact.company_id=REF_Company.company_id
	INNER JOIN Emp_Contact ON Link_Company_Emp_Contact.emp_id=Emp_Contact.emp_id
	INNER JOIN User_Account ON Emp_Contact.emp_id=User_Account.user_account_id
WHERE User_Account.user_account_id=#variables.user_account_id#
</cfquery>
</cfsilent>
