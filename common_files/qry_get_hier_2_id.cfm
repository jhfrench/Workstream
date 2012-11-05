
<!--common_files/qry_get_hier_2_id.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfquery name="get_hier_2_id" datasource="#application.datasources.main#">
SELECT COALESCE(hier_2_id, '0') AS hier_2_id
FROM View_Demographics_Workstream Demographics
WHERE emp_id=#variables.user_identification#
</cfquery>
</cfsilent>

