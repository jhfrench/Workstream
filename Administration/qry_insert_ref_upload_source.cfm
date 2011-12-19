<!-- Administration/qry_insert_ref_upload_source.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_upload_source.cfm">
	<responsibilities>
		Query to insert a new record into REF_Upload_Source table.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/27/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_upload_source" datasource="#application.datasources.main#">
INSERT INTO REF_Upload_Source (description, abbreviation, sort_order,
	active_ind, created_by, upload_template,
	worksheet_name)
VALUES ('#attributes.description#', '#attributes.abbreviation#', #attributes.sort_order#,
	#attributes.active_ind#, #session.user_account_id#, '#attributes.upload_template#',
	'#attributes.worksheet_name#')
</cfquery>