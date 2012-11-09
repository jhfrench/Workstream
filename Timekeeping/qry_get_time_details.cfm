
<!--Timekeeping/qry_get_time_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->
<cfquery name="get_time_details" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname AS last_name, Time_Entry.user_account_id, Time_Entry.task_id,
	SUM(Time_Entry.hours) AS hours
FROM Time_Entry
	INNER JOIN Emp_Contact ON Time_Entry.user_account_id=Emp_Contact.user_account_id
WHERE Time_Entry.active_ind=1
	AND Time_Entry.task_id=#attributes.task_id#<cfif isdefined("attributes.user_account_id")>
	AND Time_Entry.user_account_id=#attributes.user_account_id#</cfif>
GROUP BY Time_Entry.user_account_id, Emp_Contact.lname, Time_Entry.task_id
ORDER BY Emp_Contact.lname
</cfquery>
</cfsilent>