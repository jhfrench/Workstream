
<!--Directory/qry_get_supervisor_history.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve supervisor history based on the needs of the user.
	||
	Name: Damon Scott
	||
	Edits: 
	$Log$
	||
	Variables:
	--> attributes.emp_id: number containing the unique identifier of the individual being requested

 --->
<cfparam default="0" name="need_all_supervisors">
<cfquery name="get_supervisor_history" datasource="#application.datasources.main#">
SELECT Link_Employee_Supervisor.supervisor_id, Link_Employee_Supervisor.date_start,
		Link_Employee_Supervisor.date_end, COALESCE(Emp_Contact.LName + ', ' + Emp_Contact.Name, 'NA') AS sup_name
FROM Link_Employee_Supervisor, Emp_Contact 
WHERE Link_Employee_Supervisor.supervisor_id=Emp_Contact.emp_id<cfif isdefined("attributes.emp_id") and len(attributes.emp_id) AND need_all_supervisors NEQ 1>
	AND (Link_Employee_Supervisor.user_account_id=#attributes.emp_id#)</cfif>
ORDER BY Link_Employee_Supervisor.date_start, Link_Employee_Supervisor.date_end, sup_name
</cfquery>
</cfsilent>
