
<!--qry_get_engagement_access.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get if the user is allowed to edit engagements

	||
	Edits:
$Log$
Revision 1.0  2005/02/15 20:54:35  daugherty
Initial revision

Revision 1.2  2001-10-15 12:17:54-04  french
Optimizing queries by removing join to security table (replaced username lookup with emp_id from previous query).

Revision 1.1  2001-10-11 11:04:57-04  long
Added $log $ for edits to all CFM files that have fusedocs.
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

