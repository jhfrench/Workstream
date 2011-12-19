
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
	Revision 1.0  2005/02/15 20:42:01  daugherty
	Initial revision

	||
 --->
<cfquery name="get_hier_2_id" datasource="#application.datasources.main#">
SELECT ISNULL(hier_2_id, 0) AS hier_2_id
FROM Demographics
WHERE emp_id=#session.user_account_id#
</cfquery>
</cfsilent>

