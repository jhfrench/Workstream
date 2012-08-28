
<!--Directory/act_salary_submit.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I call the queries that are used to enter a new salary entry.
	||
	Name: Jeromy French
	||
	Edits:
	$Log: 

	 || 
	END FUSEDOC --->
</cfsilent>

<cfquery name="get_old_salary" datasource="#application.datasources.main#">
SELECT created_date, salary, salary_id
FROM Salary
WHERE active_ind=1
	AND emp_id=#attributes.emp_id#
</cfquery>
<cfif get_old_salary.recordcount>
	<cfset variables.old_salary=decrypt(get_old_salary.salary, "sillyputty")>
	<cfset variables.increase_amount=form.salary-variables.old_salary>
	<cfset variables.percent_increase=100*(increase_amount / variables.old_salary)>
	<cfset variables.deactivate_record_ind=1>
<cfelse>
	<cfset variables.increase_amount=0>
	<cfset variables.percent_increase=0>
	<cfset variables.deactivate_record_ind=0>
</cfif>
<cfset variables.salary=encrypt(form.salary,"sillyputty")>
<cfset variables.increase_amount=encrypt(increase_amount,"sillyputty")>
<cfset variables.increase_percent=encrypt(percent_increase,"sillyputty")>

<cftransaction isolation="READ_COMMITTED">
	<cfquery name="emp_salary_entry" datasource="#application.datasources.main#">
	INSERT INTO Salary (emp_id, salary, date_implemented,
		created_by, salary_change_type_id, increase_amount,
		increase_percent)
	VALUES (#attributes.emp_id#, '#variables.salary#', '#attributes.date#',
		#variables.user_identification#, #attributes.salary_change_type#, '#variables.increase_amount#',
		'#variables.increase_percent#')
	</cfquery>

	<cfif variables.deactivate_record_ind>
		<cfquery name="emp_salary_update" datasource="#application.datasources.main#">
		UPDATE Salary
		SET date_deactivated=CURRENT_TIMESTAMP,
			active_ind=0,
			date_through=#createodbcdatetime(get_old_salary.created_date)#
		WHERE salary_id=#get_old_salary.salary_id#
		</cfquery>
	</cfif>
</cftransaction>
