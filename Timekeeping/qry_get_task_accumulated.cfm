
<!--Timekeeping/qry_get_task_accumulated.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve information relevant to the use of a tasks budgeted time.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	--> session.user_account_id: id that identifies user to workstream
	--> variables.var1: number that indicates the total length of the hours used graph
	<-- budgeted_hours: number that shows how many hours were budgeted for a task
	<-- hours_used: number of hours used towards the completion of a task
	<-- image_width: number used to size image that shows what percent of budget has been used
	<-- percent_used: number that indicates what percent of budget has been used
	<-- task_id: number that uniquely identifies a task
 --->
<cfquery name="get_task_accumulated" datasource="#application.datasources.main#">
SELECT Task.task_id, COALESCE(Task.budgeted_hours,0) AS budgeted_hours, COALESCE(SUM(Time_Entry.hours),0) AS hours_used, 
(CASE WHEN COALESCE(Task.budgeted_hours,0)=0 THEN 0 ELSE SUM(Time_Entry.hours)/Task.budgeted_hours*#variables.var1# END) AS image_width, 
(CASE WHEN COALESCE(Task.budgeted_hours,0)=0 THEN 0 ELSE SUM(Time_Entry.hours)/Task.budgeted_hours*100 END) AS percent_used
FROM Time_Entry, Task
WHERE Task.task_id=Time_Entry.task_id
	AND Task.task_id=#attributes.task_id#
GROUP BY Task.task_id, Task.budgeted_hours
</cfquery>
</cfsilent>

