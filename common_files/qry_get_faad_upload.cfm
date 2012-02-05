<!-- common_files/qry_get_faad_upload.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_faad_upload.cfm">
	<responsibilities>
		I retrieve completed FAAD records in the upload log, ordered by most recent first
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="12/3/2010" role="FuseCoder" comments="Created File">
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
<cfquery name="get_faad_upload" datasource="#application.datasources.main#">
SELECT upload_id, created_date
FROM LOG_Upload
WHERE active_ind=1
	AND records_loaded IS NOT NULL
	AND upload_source_id=5 /*FAAD*/
ORDER BY created_date DESC
</cfquery>