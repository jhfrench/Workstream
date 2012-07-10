
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
SELECT COALESCE(hier_2_id, 0) AS hier_2_id
FROM Demographics_Ngauge Demographics
WHERE emp_id=#session.user_account_id#
</cfquery>
</cfsilent>

