<!-- common_files/qry_insert_link_email_upload.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_link_email_upload.cfm">
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
<cfquery name="insert_link_email_upload" datasource="#application.datasources.main#">
INSERT INTO Link_Email_Upload (email_id, upload_id, created_by)
SELECT LOG_Email_SEQ.CURRVAL AS email_id, upload_id, #variables.created_by# AS created_by
FROM LOG_Upload
WHERE upload_id IN (#attributes.upload_id#)
</cfquery>