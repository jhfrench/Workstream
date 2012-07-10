<!-- Administration/qry_get_comments.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_comments.cfm">
	<responsibilities>
		Query to get comments from Comments table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/9/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>

		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->

<!---<cfquery name="get_comments_count" datasource="#application.datasources.main#">
SELECT COUNT(*) AS count1
FROM Comments
WHERE active_ind=1
</cfquery>--->
<cfparam name="comments_id" default="0">
<cfquery name="get_comments" datasource="#application.datasources.main#">
SELECT comments_id, comments_id, SUBSTRING(description, 1, 100) || '...' as description
FROM Comments
WHERE <cfif attributes.comments_id NEQ 0>comments_id=#attributes.comments_id#<cfelse>active_ind=1</cfif>
ORDER BY description
</cfquery>
<cfset caller.get_comments=get_comments>
