<!-- common_files/qry_insert_link_screen_help_faq.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_link_screen_help_faq.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/25/2009" role="FuseCoder" comments="Created File">
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
<cfquery name="insert_link_screen_help_faq" datasource="#application.datasources.main#">
INSERT INTO Link_Screen_Help_FAQ (screen_id, help_faq_id, created_by,
	active_ind)
VALUES (#variables.screen_id#, #get_help_faq_id.help_faq_id#, #variables.created_by#,
	#attributes.active_ind#)
</cfquery>