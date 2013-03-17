
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
	--> variables.user_identification: number that uniquely identifies the user
 --->
<cfquery name="time_allocation_blurb" datasource="#application.datasources.main#">
SELECT SUM(hours) AS project_hours, (Customer.description || '-' || Project.description) AS project_name, Project.project_id
FROM Time_Entry
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN Customer ON Customer.customer_id=Project.customer_id
WHERE Time_Entry.active_ind=1
	AND EXTRACT(MONTH FROM Time_Entry.work_date) = EXTRACT(MONTH FROM CURRENT_DATE)
	AND EXTRACT(YEAR FROM Time_Entry.work_date) = EXTRACT(YEAR FROM CURRENT_DATE)
	AND Time_Entry.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
GROUP BY Customer.description, Project.description, Project.project_id
ORDER BY project_hours DESC
</cfquery>
</cfsilent>