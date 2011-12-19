<!-- common_files/qry_get_upload_file.cfm
	Author: Stephen Liu -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_upload_file.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="csliu@nasa.gov" author="Stephen Liu" type="create" date="7/28/2009" role="FuseCoder" comments="Created File">
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

<!---uploads--->
<cfquery name="get_upload_file" datasource="#application.datasources.main#">
SELECT upload_id, archived_file_name, original_file_name 
FROM LOG_Upload 
WHERE upload_id IN (#attributes.upload_id#)
</cfquery>
<cfset caller.get_upload_file=get_upload_file>