
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
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	<-- tasks_pre_defined_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_predefined_names" datasource="#application.datasources.main#">
SELECT *
FROM Tasks_Pre_Defined
</cfquery>
</cfsilent>

