
<!--Timekeeping/qry_time_allocation_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the hours an employee worked in the last two months.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> session.user_account_id: number that uniquely identifies the user
 --->
<cfquery name="time_allocation_blurb" datasource="#application.datasources.main#">
SELECT SUM(hours) AS project_hours, (Customer.description || '-' || Project.description) AS project_name, Project.project_id
FROM Time_Entry, Project, Customer
WHERE Customer.customer_id=Project.customer_id
	AND Time_Entry.project_id=Project.project_id
	AND Time_Entry.emp_id=#session.user_account_id#
	AND EXTRACT(MONTH FROM Time_Entry.date) = EXTRACT(MONTH FROM CURRENT_TIMESTAMP)
	AND EXTRACT(YEAR FROM Time_Entry.date) = EXTRACT(YEAR FROM CURRENT_TIMESTAMP)
GROUP BY Customer.description, Project.description, Project.project_id
ORDER BY project_hours DESC
</cfquery>
</cfsilent>

