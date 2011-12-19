<!-- Home/qry_get_discussion.cfm
	Author: Lawrence Darrah-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_discussion.cfm">
	<responsibilities>
		I retrieve data from the Discussion table for a given user.
	</responsibilities>
	<properties>
		<history email="lawrence.e.darrah@nasa.gov" author="Lawrence Darrah" type="create" date="7/24/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_discussion" datasource="#application.datasources.main#">
SELECT Discussion.discussion_id, Discussion.parent_discussion_id, Discussion.top_level_ind,
	Discussion.discussion_category, Discussion.discussion_title, Discussion.discussion_text,
	Discussion.created_date, Discussion.link, Demographics.last_name || ', ' || Demographics.first_name AS created_by
FROM Discussion
	INNER JOIN Demographics ON Discussion.created_by=Demographics.user_account_id
WHERE Discussion.active_ind=1
	AND Demographics.active_ind=1<cfif isdefined("attributes.discussion_id")>
	AND Discussion.discussion_id=#attributes.discussion_id#</cfif><cfif isdefined("attributes.parent_discussion_id")>
	AND Discussion.parent_discussion_id=#attributes.parent_discussion_id#</cfif>
ORDER BY Discussion.discussion_id
</cfquery>

<cfset caller.get_discussion=get_discussion>