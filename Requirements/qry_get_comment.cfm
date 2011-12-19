<!-- Requirements/qry_get_comment.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_comment.cfm">
	<responsibilities>
		Query to retrieve a comment selected.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_comment" datasource="#application.datasources.main#">
SELECT Comments.comments_id, Comments.comments_type_id, Comments.comments_number,
	Comments.description AS comment_description, Comments.active_ind, Link_Screen_Comments.screen_id,
	Link_Screen_Comments.sort_order
FROM Comments
	INNER JOIN Link_Screen_Comments ON Comments.comments_id=Link_Screen_Comments.comments_id
WHERE Comments.comments_id=#attributes.comments_id#
</cfquery>