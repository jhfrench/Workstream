<!-- Administration/qry_deactivate_link_screen_comments.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_link_screen_comments.cfm">
	<responsibilities>
		Query to deactivate a record in Link_Screen_Comments table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/6/2007" role="FuseCoder" comments="Created File">
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
