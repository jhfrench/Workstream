
<!--Customers/qry_change_billable_type_id.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the main project details.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="change_billable_type_id" datasource="#application.datasources.main#">
UPDATE Project
SET billable_type_id=#attributes.billable_type_id#
WHERE Project.project_id=#attributes.project_id#
</cfquery>
</cfsilent>

