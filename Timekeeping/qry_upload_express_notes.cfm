<!--- 
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
Revision 1.2  2005/03/09 18:28:28  stetzer
<>

Revision 1.1  2005-03-04 11:22:10-05  french
Fixing date entry to use SQL GETDATE().

Revision 1.0  2005-02-15 16:00:43-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:54:31-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.notes_#ii#: string that contains the notes that correspond to a particular time entry
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	--> session.user_account_id: id that identifies user to workstream
	--> request.note: string that contains the note that corresponds to a particular time entry
 --->
<cfparam name="attributes.notes_type_id" default=1>
<cfquery name="upload_express_notes" datasource="#application.datasources.main#">
INSERT INTO Notes(task_id, emp_id, notes_type_id, date, note)
VALUES (#listgetat(attributes.task_id,ii)#, #session.user_account_id#, #attributes.notes_type_id#, GETDATE(), '#HTMLEditFormat(request.note)#')
</cfquery>
</cfsilent>
 --->
<cfser>