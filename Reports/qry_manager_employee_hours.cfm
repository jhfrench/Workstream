
<!--Reports/qry_manager_employee_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset supervisor_user_account_id=Get_Client_info.supervisor_user_account_id>
<cfquery name="ind_emp" datasource="#application.datasources.main#">
SELECT Project.project_code AS code, 
    Project.description AS client, Demographics.user_account_id, 
    Time_Entry.Hours, Time_Entry.work_date
FROM Project, Demographics, Time_Entry
WHERE Demographics.user_account_id=Time_Entry.user_account_id
	AND Project.project_id = Time_Entry.project_id
	AND Demographics.user_account_id=#supervisor_user_account_id#
	AND Time_Entry.active_ind=1
	AND Time_Entry.work_date >= '#From_date#'
	AND Time_Entry.work_date <= '#Through_Date#'
	AND (Time_Entry.work_date between hire_date AND turnover_date
		OR turnover_date IS NULL AND Time_Entry.work_date >= hire_date)
	AND ((Employee.hire_date <= #createodbcdate(variables.through_date)#
		AND turnover_date >= #createodbcdate(variables.from_date)#) 
			OR (turnover_date IS NULL AND hire_date  <= #createodbcdate(variables.through_date)#))
ORDER BY date, client, hours
</cfquery>
</cfsilent>

