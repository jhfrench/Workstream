
<!--common_files/qry_get_subordinates.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French (jeromy_french@hotmail.com)
	||
	Edits:
	$Log$
	 || 
 --->
 <!--- $issue$: need to consolidate Link_Employee_Supervisor and Supervisor tables --->
<cfparam name="attributes.date_linked" default="">
<cfparam name="attributes.all_employees" default="0">
</cfsilent>
<cfquery name="get_subordinates" datasource="#application.datasources.main#">
SELECT Emp_Contact.name, Emp_Contact.lname, (LEFT(Emp_Contact.name,2) || LEFT(Emp_Contact.lname,2)) AS initials,
	Emp_Contact.emp_id, Emp_Contact.lname || ', ' || LEFT(Emp_Contact.name,2) AS display
FROM Emp_Contact
	INNER JOIN Link_Employee_Supervisor ON Emp_Contact.emp_id=Link_Employee_Supervisor.emp_id
		AND Link_Employee_Supervisor.supervisor_id=#variables.user_identification#<cfif NOT isdefined("attributes.hide_supervisor")>
		OR Emp_Contact.emp_id=#variables.user_identification#</cfif>
	INNER JOIN Demographics_Ngauge AS Demographics ON Emp_Contact.emp_id=Demographics.emp_id
WHERE 1=1<cfif NOT attributes.all_employees>
	AND <cfif len(attributes.date_linked)>#createodbcdate(attributes.date_linked)# BETWEEN Link_Employee_Supervisor.date_start AND COALESCE(Link_Employee_Supervisor.date_end,#createodbcdate(attributes.date_linked)#+INTERVAL '1 day')<cfelse>CURRENT_TIMESTAMP BETWEEN Link_Employee_Supervisor.date_start AND COALESCE(Link_Employee_Supervisor.date_end, CURRENT_DATE+INTERVAL '1 day')</cfif>
	AND CURRENT_DATE BETWEEN Demographics.hire_date AND COALESCE(Demographics.effective_to,CURRENT_DATE+INTERVAL '1 day')</cfif>
GROUP BY Emp_Contact.name, Emp_Contact.lname, Emp_Contact.emp_id
ORDER BY Emp_Contact.lname, Emp_Contact.name
</cfquery>
<cfset variables.subordinates_emp_id=valuelist(get_subordinates.emp_id)>