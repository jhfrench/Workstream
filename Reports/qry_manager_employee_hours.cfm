
<!--Reports/qry_manager_employee_hours.cfm
	Author: Jeromy F  -->
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
    Project.Description AS client, Demographics.emp_id, 
    Time_Entry.Hours, Time_Entry.Date
FROM Project, Demographics, Time_Entry
WHERE Demographics.emp_id = Time_Entry.emp_id
	AND Project.project_id = Time_Entry.project_id
	AND Demographics.emp_id = #supervisor_user_account_id#
	AND Time_Entry.date >= '#From_date#'
	AND Time_Entry.date <= '#Through_Date#'
	AND (Time_Entry.date between effective_from AND effective_to
		OR effective_to IS NULL AND Time_Entry.date >= effective_from)
	AND ((Demographics.effective_from <= #createodbcdate(variables.through_date)#
		AND effective_to >= #createodbcdate(variables.from_date)#)      
			OR (effective_to IS NULL AND effective_from  <= #createodbcdate(variables.through_date)#))
ORDER BY date, client, hours
</cfquery>
</cfsilent>

