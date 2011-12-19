
<!--qry_get_engagement_access.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get if the user is allowed to edit engagements

	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfquery name="get_engagement_access" datasource="#application.datasources.main#">
SELECT ISNULL(active_ind, 0) AS active_ind, object_id
FROM Security_Object_Access
WHERE Security_Object_Access.object_id = 45
	AND Security_Object_Access.emp_id=#general_user_info.emp_id#
</cfquery>
</cfsilent>

