<!-- common_files/qry_get_log_upload.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_log_upload.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/23/2009" role="FuseCoder" comments="Created File">
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
<cfquery name="get_log_upload" datasource="#application.datasources.main#">
SELECT LOG_Upload.upload_id, LOG_Upload.user_ip_address, LOG_Upload.original_file_name,
	LOG_Upload.archived_file_name, LOG_Upload.upload_source_id, COALESCE(REF_Upload_Source.description, 'Not specified') AS upload_source,
	LOG_Upload.created_date, Demographics.last_name || ', ' || Demographics.first_name AS created_by, LOG_Upload.active_ind
FROM LOG_Upload
	LEFT OUTER JOIN Demographics ON LOG_Upload.created_by=Demographics.user_account_id
		AND Demographics.active_ind=1
	LEFT OUTER JOIN REF_Upload_Source ON LOG_Upload.upload_source_id=REF_Upload_Source.upload_source_id
WHERE <cfif isdefined("attributes.upload_id")>LOG_Upload.upload_id IN (#attributes.upload_id#)<cfelse>active_ind=1</cfif>
ORDER BY LOG_Upload.upload_id
</cfquery>