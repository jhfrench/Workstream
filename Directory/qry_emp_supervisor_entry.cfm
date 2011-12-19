
<!--Directory/qry_emp_supervisor_entry.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a supervisor record.
	||
	Name: Damon Scott
	||
	Edits: 
	
	||
	
 --->
</cfsilent>
<cfparam default="0" name="attributes.supervisor_id_list">
<cfparam default="" name="form.supervisor_id_list">
<cfparam default="1" name="form.num_present_supervisors">
<!--- 
<cfquery name="get_old_supervisors" datasource="#application.datasources.main#">
SELECT TOP #form.num_present_supervisors# l_e_s_id, supervisor_id
FROM Link_Employee_Supervisor
WHERE emp_id=#variables.emp_id#
ORDER BY date_start DESC
</cfquery>
 --->
<cfif isdefined("attributes.date")>
	<cfset attributes.hire_date=attributes.date>
</cfif>
<cfquery name="emp_supervisor_entry" datasource="#application.datasources.main#">
INSERT INTO Link_Employee_Supervisor (emp_id, supervisor_id, date_start, active_ind)
VALUES (#attributes.emp_id#, #attributes.supervisor_id#, #createodbcdate(attributes.hire_date)#, 1)
</cfquery>
<cfif len(form.supervisor_id_list)>
<cfloop index="ii" list="#form.supervisor_id_list#" delimiters=",">
<cfquery name="emp_supervisor_update" datasource="#application.datasources.main#">
UPDATE Link_Employee_Supervisor
SET date_end=#createodbcdate(evaluate("attributes.end_date_#ii#"))#,
	active_ind=0
WHERE supervisor_id=#ii#
	AND emp_id=#attributes.emp_id#
	AND date_end IS NULL
</cfquery>
</cfloop>
</cfif>

