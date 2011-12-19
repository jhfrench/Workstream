
<!--Timekeeping/qry_upload_notes.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I upload the info to the Notes table.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.2  2005/03/09 18:28:30  stetzer
	<>

	Revision 1.1  2005-03-04 11:21:54-05  french
	Fixing date entry to use SQL GETDATE().

	Revision 1.0  2005-02-15 16:00:43-05  daugherty
	Initial revision

	Revision 1.2  2002-01-04 10:05:11-05  french
	Added Time to the data captured in the date field. This will make it possible to do evaluations between when a task is entered and when the first note is recorded, for example.

	Revision 1.1  2001-10-11 10:54:30-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> [attributes.file_path]: string, though the variable is essential used as a boolean--if it exists than the notes are being submitted from the task_details page
	--> attributes.notes_#ii#: string that contains the notes that correspond to a particular time entry
	--> attributes.notes_type_id: number that indicates what type of note is being entered into the database
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	--> session.user_account_id: id that identifies user to workstream
	--> request.note: string that contains the note that corresponds to a particular time entry
 --->
<cfif isdefined("attributes.file_path")>
	<cfset request.note=attributes.notes>
<cfelse>
	<cfset request.note=evaluate("attributes.notes_#ii#")>
</cfif>
<cfparam name="attributes.notes_type_id" default=1>
<cfquery name="upload_express_notes" datasource="#application.datasources.main#">
INSERT INTO Notes(task_id, emp_id, notes_type_id, date, note)
VALUES (<cfif isdefined("project_entry")>0<cfelse>#listgetat(attributes.task_id,ii)#</cfif>, #session.user_account_id#,#attributes.notes_type_id#, GETDATE(), '#HTMLEditFormat(request.note)#')
</cfquery>
</cfsilent>

