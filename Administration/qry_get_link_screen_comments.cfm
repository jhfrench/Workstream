<!-- Administration/qry_get_link_screen_comments.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_link_screen_comments.cfm">
	<responsibilities>
		Query to get link screen comments.
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
<cfparam name="attributes.l_s_c_id" default="0">
<cfquery name="get_link_screen_comments" datasource="#application.datasources.main#">
SELECT l_s_c_id, screen_id, comments_id,
	sort_order
FROM Link_Screen_Comments
WHERE <cfif attributes.l_s_c_id NEQ 0>l_s_c_id=#attributes.l_s_c_id#<cfelse>active_ind=1</cfif>
ORDER BY screen_id, comments_id
</cfquery>