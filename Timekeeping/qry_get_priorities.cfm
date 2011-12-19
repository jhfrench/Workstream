
<!--Timekeeping/qry_get_priorities.cfm
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
Revision 1.1  2005/03/09 18:24:37  stetzer
<>

Revision 1.1  2001-10-11 10:54:45-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_priorities" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT priority_id, description
FROM REF_Priority
WHERE #application.last_updated#=#application.last_updated#
ORDER BY display_order
</cfquery>
</cfsilent>

