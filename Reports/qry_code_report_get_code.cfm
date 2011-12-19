
<!--Reports/qry_code_report_get_code.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the name of the code and the code number of the code in the code report

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:12:46  stetzer
	<>

	||
	END FUSEDOC --->
<cfquery name="get_code" datasource="#application.datasources.main#">
SELECT Project.Project_Code + + ' - ' + + Project.Description AS display
FROM Project
WHERE project_id=#attributes.project_id#
</cfquery>
</cfsilent>