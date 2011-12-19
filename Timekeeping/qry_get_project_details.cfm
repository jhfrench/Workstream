
<!--Timekeeping/qry_get_project_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the notes_id of the latest (and greatest) entry into Notes.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:24:41  stetzer
	<>

	Revision 1.3  2002-02-08 14:19:39-05  french
	Removed redundant evaluations.

	Revision 1.2  2002-02-08 12:12:29-05  long
	Changed the query with Tim's help to reduct the possibibity of deadlocks.
	
	Revision 1.1  2001-10-11 10:54:45-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	--> session.user_account_id: id that identifies user to workstream
	<-- notes_id: number that uniquely identifies a Notes entry
	<-- project_id: number that uniquely identifies a Project entry
 --->
<cfparam name="ii" default=1>
<cfquery name="get_project_details" datasource="#application.datasources.main#">
SELECT @@identity  AS notes_id<cfif NOT isdefined("project_entry")>, task.project_id
FROM  Task
WHERE task.task_id=#listgetat(attributes.task_id,ii)# 
GROUP BY task.project_id</cfif> 
</cfquery>
</cfsilent>

