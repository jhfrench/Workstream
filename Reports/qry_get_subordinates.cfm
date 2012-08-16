
<!--Reports/qry_get_subordinates.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I run the queries that show PTO-elligible employees in the drop-down selection.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_subordinates" datasource="#application.datasources.main#">
SELECT emp_id
FROM Link_Employee_Supervisor 
WHERE supervisor_id=#session.user_account_id#
	AND CURRENT_TIMESTAMP BETWEEN date_start and COALESCE(date_end, CURRENT_TIMESTAMP+'1 day')
</cfquery>
</cfsilent>

