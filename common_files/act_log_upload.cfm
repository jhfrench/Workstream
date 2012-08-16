<!-- common_files/act_log_upload.cfm.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_log_upload.cfm.cfm">
	<responsibilities>
		I log a data upload attempt by the user. I INSERT INTO the LOG_Upload table the date/time, session.user_account_id, cgi.REMOTE_ADDR, file being uploaded (original name and archived name), and the upload_source_id.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/17/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="variables.original_file_name" default="probably_#left(listlast(attributes.my_file,"/"),91)#">
<cfparam name="variables.archived_file_name" default="NOT ARCHIVED">
<cfquery name="insert_log_upload" datasource="#application.datasources.main#">
INSERT INTO LOG_Upload (created_date, created_by, user_ip_address,
	original_file_name, archived_file_name,	upload_source_id)
VALUES (CURRENT_TIMESTAMP, '#session.user_account_id#', '#cgi.remote_addr#',
	'#variables.original_file_name#','#variables.archived_file_name#', #attributes.upload_source_id#)
</cfquery>

<cfquery name="get_upload_id" datasource="#application.datasources.main#">
SELECT CURRVAL('Log_Upload_upload_id_SEQ') AS upload_id
</cfquery>
<cfset attributes.upload_id=get_upload_id.upload_id>