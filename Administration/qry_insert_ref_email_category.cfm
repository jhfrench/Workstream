<!-- Administration/qry_insert_ref_priority.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_email_category.cfm">
	<responsibilities>
		Query to insert a new priority into REF_Priority table.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_email_category" datasource="#application.datasources.main#">
INSERT INTO REF_Email_Category (description, sort_order, created_by,
	active_ind)
VALUES ('#attributes.description#', #attributes.sort_order#, #session.user_account_id#,
	#attributes.active_ind#)
</cfquery>