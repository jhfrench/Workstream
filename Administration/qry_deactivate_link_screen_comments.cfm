<!-- Administration/qry_deactivate_link_screen_comments.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_link_screen_comments.cfm">
	<responsibilities>
		Query to deactivate a record in Link_Screen_Comments table before a new insert.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="7/6/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_link_screen_comments" datasource="#application.datasources.main#">
UPDATE Link_Screen_Comments
SET active_ind=0
WHERE active_ind=1
	AND l_s_c_id=#attributes.l_s_c_id#
</cfquery>
