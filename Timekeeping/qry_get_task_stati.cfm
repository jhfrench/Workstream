
<!--Timekeeping/qry_get_task_stati.cfm
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
	Revision 1.1  2005/03/09 18:26:25  stetzer
	<>

	Revision 1.3  2002-04-02 11:06:42-05  french
	Added dynamic caching.

	Revision 1.2  2002-04-02 08:47:31-05  lee
	Changed ORDER BY to new Order_By column
	
	Revision 1.1  2001-10-11 10:54:43-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> application.last_updated: date that marks the last time the get_task_stati query changed
	<-- status_id: number that identifies a status to workstream
	<-- status: string that contains the name (of the status) to display to the user
 --->
<cfquery name="get_task_stati" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT status_id, status
FROM REF_Status
WHERE #application.last_updated#=#application.last_updated#
ORDER BY order_by
</cfquery>
</cfsilent>

