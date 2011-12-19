<!-- Administration/qry_deactivate_ref_upload_source.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_upload_source.cfm">
	<responsibilities>
		Query to diactivate a record in REF_Upload_Source table before a new insert.
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

<cfquery name="deactivate_ref_upload_source" datasource="#application.datasources.main#">
UPDATE REF_Upload_Source
SET active_ind=0
WHERE active_ind=1
	AND upload_source_id=#attributes.upload_source_id#
</cfquery>
