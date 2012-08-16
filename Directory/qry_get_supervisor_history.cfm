
<!--Directory/qry_get_supervisor_history.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve supervisor history based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	--> attributes.emp_id: number containing the unique identifier of the individual being requested

 --->
<cfquery name="get_supervisor_history" datasource="#application.datasources.main#">
SELECT Link_Employee_Supervisor.supervisor_id, Link_Employee_Supervisor.date_start, Link_Employee_Supervisor.date_end,
	COALESCE(Emp_Contact.LName || ', ' || Emp_Contact.Name, 'NA') AS sup_name, CASE WHEN Link_Employee_Supervisor.date_end IS NULL THEN 1 ELSE 0 END AS current_supervisor_ind
FROM Link_Employee_Supervisor
	INNER JOIN Emp_Contact ON Link_Employee_Supervisor.supervisor_id=Emp_Contact.emp_id<cfif isdefined("attributes.emp_id") AND len(attributes.emp_id)>
WHERE Link_Employee_Supervisor.emp_id=#attributes.emp_id#</cfif>
ORDER BY Link_Employee_Supervisor.date_start, Link_Employee_Supervisor.date_end, sup_name
</cfquery>
</cfsilent>
