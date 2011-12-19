
<!--Timekeeping/qry_get_predefined_names.cfm
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
Revision 1.1  2005/03/09 18:24:32  stetzer
<>

Revision 1.1  2001-10-11 10:54:46-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	<-- tasks_pre_defined_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_predefined_names" datasource="#application.datasources.main#">
SELECT *
FROM Tasks_pre_defined
</cfquery>
</cfsilent>

