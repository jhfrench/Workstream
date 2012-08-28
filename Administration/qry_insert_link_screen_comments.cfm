<!-- Administration/qry_insert_link_screen_comments.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_link_screen_comments.cfm">
	<responsibilities>
		Query to insert a record into Link_Screen_Comments table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/6/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_link_screen_comments" datasource="#application.datasources.main#">
INSERT INTO Link_Screen_Comments (screen_id, comments_id, sort_order,
	created_by, active_ind)
VALUES ('#attributes.screen_id#', #attributes.comments_id#, #attributes.sort_order#,
	#variables.user_identification#, #attributes.active_ind#)
</cfquery>