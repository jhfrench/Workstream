
<!--Timekeeping/qry_insert_time_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I upload the info to the Time_Entry table.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.date: list that contains dates submitted from the express timekeeping page
	--> attributes.hours: list that contains hours submitted from the express timekeeping page
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	--> variables.user_identification: id that identifies user to workstream
	--> get_project_details.notes_id: number that uniquely identifies a Notes entry
	--> get_project_details.project_id: number that uniquely identifies a Project entry
 --->
<cfparam name="ii" default=1>
<cfquery name="insert__time_entry" datasource="#application.datasources.main#">
INSERT INTO Time_Entry (user_account_id, work_date, hours,
	project_id, task_id, notes_id,
	created_by)
VALUES (#variables.user_identification#, #createodbcdate(listgetat(attributes.date,ii))#, #listgetat(attributes.hours,ii)#,
	<cfif isdefined("project_entry")>#listgetat(attributes.project_id,ii)#<cfelse>#get_project_details.project_id#</cfif>,<cfif isdefined("project_entry")>0<cfelse>#listgetat(attributes.task_id,ii)#</cfif>,#get_project_details.notes_id#,
	#variables.user_identification#)
</cfquery>
</cfsilent>
