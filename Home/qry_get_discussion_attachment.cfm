<!-- Home/qry_get_discussion_attachment.cfm
	Author: Lawrence Darrah-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_discussion_attachment.cfm">
	<responsibilities>
		I retrieve data from the Discussion_Attachment table for a given discussion.
	</responsibilities>
	<properties>
		<history email="lawrence.e.darrah@nasa.gov" author="Lawrence Darrah type="create" date="8/24/2007" role="FuseCoder" comments="Created File">
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



<cfquery name="get_discussion_attachment" datasource="#application.datasources.main#">
SELECT *
FROM Discussion_Attachment
WHERE Discussion_Attachment.discussion_id=#attributes.discussion_id#
</cfquery>

<cfset caller.get_discussion_attachment=get_discussion_attachment>