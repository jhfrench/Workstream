
<!--common_files/qry_get_associated_files.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select a list of all the companies that a user is allowed to see.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:56  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:42-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	<-- file_id: number that uniquely identifies each associated file for a particular task
	<-- file_path: string that indicates the path to a particular file
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_associated_files" datasource="#application.datasources.main#">
SELECT file_id, file_path
FROM Associated_Files
WHERE task_id=#attributes.task_id#
ORDER BY file_path
</cfquery>

