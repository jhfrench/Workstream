
<!--Directory/qry_emp_salary_entry.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a salary record.
	||
	Name: Damon Scott
	||
	Edits: 
	
	||
	
 --->

	
<cfquery name="get_old_salary" datasource="#application.datasources.main#">
SELECT TOP 1 created_date, salary, salary_id
FROM Salary
WHERE emp_id='#attributes.emp_id#'
ORDER BY created_date ASC
</cfquery>
	<cfif get_old_salary.recordcount>
		<cfset variables.old_salary=Decrypt(get_old_salary.salary, "sillyputty")>
		<cfset variables.increase_amount=form.salary -variables.old_salary>
		<cfset variables.percent_increase=100*(increase_amount / variables.old_salary)>
		<cfset variables.deactivate_record=1>
	<cfelse>
		<cfset variables.increase_amount=0>
		<cfset variables.percent_increase=0>
		<cfset variables.deactivate_record=0>
	</cfif>

<cfset variables.salary=Encrypt(form.salary,"sillyputty")>
<cfset variables.increase_amount=Encrypt(increase_amount,"sillyputty")>
<cfset variables.increase_percent=Encrypt(percent_increase,"sillyputty")>
<cfquery name="emp_salary_entry" datasource="#application.datasources.main#">
INSERT INTO Salary (emp_id, salary, created_date,
	 date_implemented, active_ind, entered_by,
	 salary_change_type_id, increase_amount, increase_percent)
VALUES (#attributes.emp_id#, '#variables.salary#', CURRENT_TIMESTAMP,
	'#attributes.date#', 1, #session.user_account_id#,
	#attributes.salary_change_type#, '#variables.increase_amount#', '#variables.increase_percent#')
</cfquery>

<cfif deactivate_record>
<cfquery name="emp_salary_update" datasource="#application.datasources.main#">
UPDATE Salary
SET date_deactivated=CURRENT_TIMESTAMP,
	active_ind=0,
	date_through=#createodbcdatetime(get_old_salary.created_date)#
WHERE salary_id=#get_old_salary.salary_id#
</cfquery>
</cfif>
