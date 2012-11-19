
<!-- common_files/qry_get_max_project_id.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the max project id this is used in transactional inserts...

	||
	Edits:
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="get_max_project_id" datasource="#application.datasources.main#">
SELECT CURRVAL('Project_project_id_SEQ') AS project_id
</cfquery>
</cfsilent>