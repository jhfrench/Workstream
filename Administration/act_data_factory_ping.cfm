<!-- Administration/act_data_factory_ping.cfm
	Author: Jeromy French -->
	<!--- $issue$: this needs to be removed. --->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_data_factory_ping.cfm">
	<responsibilities>
		I am executed by a scheduled CF job. When I run, I log into the HQ FTP server and look for the existence of specified files (PRIM (2), FAAD (5) and SAP (4) are the default, but can be limited with the url parameter url.upload_source_type_id). If the specified file exists, I rename a copy of the file using mask [feed type]_[yyyy]_[mm]_01.[original_extension], I transfer a copy of that file to the /Uploaded_Files folder, I log the original and new file names to LOG_Upload, then I kick off the relevant data factory process to retreive/process/delete the file from the FTP server. To be clear--this CF process only handles archival of the file, and kicking off the SQL Server job that will do the rest.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/30/2007" role="FuseCoder" comments="Created File">
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
<cfset variables.datafactory_notification="">
<cfparam name="attributes.upload_source_id" default="2,4,5">

<cfquery name="get_active_processes" datasource="#application.datasources.main#">
SELECT LOG_Upload.upload_source_id, LOG_Upload.upload_id, LOG_Upload.created_date,
	REF_Upload_Source.abbreviation
FROM LOG_Upload
	INNER JOIN REF_Upload_Source ON LOG_Upload.upload_source_id=REF_Upload_Source.upload_source_id
WHERE LOG_Upload.active_ind=1
	AND LOG_Upload.end_date IS NULL
ORDER BY upload_id
</cfquery>
<cfset variables.active_upload_source_id=listappend("0", valuelist(get_active_processes.upload_source_id))>

<cfquery name="get_ftp_credentials" datasource="#application.datasources.main#">
SELECT REF_Upload_Source.upload_source_id, REF_Upload_Source.upload_template, REF_Upload_Source.abbreviation,
	'faad_' || LOWER(REF_Upload_Source.abbreviation) AS ftp_username, FTP_Passwords.ftp_password
FROM REF_Upload_Source
	INNER JOIN (
		SELECT RIGHT(setting_name, 1) AS upload_source_id, setting_value AS ftp_password
		FROM Custom_Setting
		WHERE active_ind=1
			AND setting_name LIKE 'ftp_password_%'
	) FTP_Passwords ON REF_Upload_Source.upload_source_id=FTP_Passwords.upload_source_id
WHERE REF_Upload_Source.active_ind=1
	AND REF_Upload_Source.upload_source_id NOT IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#variables.active_upload_source_id#" />) /*don't deal with any feeds that are still processing from the last call*/
	AND REF_Upload_Source.upload_source_id IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#attributes.upload_source_id#" />)
ORDER BY REF_Upload_Source.sort_order
</cfquery>

<cfoutput>
<cfsavecontent variable="variables.old_processes">
<p>DEALING WITH UPLOAD_SOURCE_ID: #attributes.upload_source_id#<cfif get_active_processes.recordcount><br />
NOTE: These processes are still running from a previous call and will not be addressed now:<br />
<table>
	<tr>
		<th>upload_source_id</th>
		<th>feed</th>
		<th>start</th>
		<th>upload_id</th>
	</tr>
<cfloop query="get_active_processes">
	<tr>
		<td style="text-align:right">#upload_source_id#</td>
		<td>#abbreviation#</td>
		<td style="text-align:right">#dateformat(created_date)# #timeformat(created_date,'HH:MM')#</td>
		<td>#upload_id#</td>
	</tr>
</cfloop>
</table>
</cfif>
</p>
</cfsavecontent>
#variables.old_processes#

<cfif get_active_processes.recordcount>
	<cfquery name="get_oldest_process" dbtype="query">
	SELECT MIN(created_date) AS oldest_process
	FROM get_active_processes
	</cfquery>
	<cfif datediff("h", get_oldest_process.oldest_process, now()) GT 4 AND listfind("2,3,4,5,6",datepart("w",now())) AND datepart("h",now()) EQ 10 AND len(application.support_email_recipients) AND len(application.email_server_name)>
		<cfmail to="#application.support_email_recipients#" from="#application.application_specific_settings.system_email_sender#" subject="FAAD Data Factory Stuck" server="#application.email_server_name#" type="HTML">
		#variables.old_processes#
		</cfmail>
	</cfif>
</cfif>
</cfoutput>

<!---When I run, I log into the HQ FTP server and look for the existence of specified files (PRIM, FAAD and SAP are the default, but can be limited with the url parameter url.upload_source_type_id). --->
<cfoutput query="get_ftp_credentials">
	<cftransaction>
		<p><hr />CONNECTING to #abbreviation# (#upload_source_id#)</p>
		<cfftp connection="ftp_#abbreviation#" action="open" server="ftp.ait.com" username="#get_ftp_credentials.ftp_username#" password="#get_ftp_credentials.ftp_password#" stoponerror="Yes">

			<p>CHECKING FOR FILES</p>
			<cfftp connection="ftp_#abbreviation#" action="LISTDIR" stoponerror="Yes" name="list_files" directory="" asciiextensionlist="#upload_template#">
			<cfset variables.original_file_name="">
			<cfloop query="list_files">
				<cfif NOT comparenocase(right(name,len(get_ftp_credentials.upload_template)),get_ftp_credentials.upload_template)>
					<cfset variables.original_file_name=name>
					<cfbreak>
				</cfif>
			</cfloop>

			<!---If the specified file exists, --->
			<cfif len(variables.original_file_name)>
				<p>FILE FOUND</p>
				<cfquery name="get_log_upload" datasource="#application.datasources.main#">
				SELECT MAX(REF_Date.fiscal_year) AS fiscal_year, MAX(REF_Date.date_month) AS date_month, COALESCE(MAX(LEFT(RIGHT(LOG_Upload.archived_file_name,6),2)),0) AS file_count
				FROM REF_Date
					LEFT OUTER JOIN LOG_Upload ON REF_Date.fiscal_year=LOG_Upload.data_fiscal_year
						AND REF_Date.date_month=LOG_Upload.data_fiscal_month
						AND LOG_Upload.active_ind=1
						AND LOG_Upload.upload_source_id=#get_ftp_credentials.upload_source_id#
				WHERE date_month=EXTRACT(MONTH FROM CURRENT_TIMESTAMP-interval '1 month')
					AND date_year=EXTRACT(YEAR FROM CURRENT_TIMESTAMP+interval '1 month')
				GROUP BY date_month
				</cfquery>

				<!---I rename a copy of the file using mask [feed type]_[yyyy]_[mm]_[file month count].[original_extension], --->
				<cfset variables.archived_file_name="#get_ftp_credentials.abbreviation#_#get_log_upload.fiscal_year#_#right('0#get_log_upload.date_month#',2)#_#right('0#get_log_upload.file_count+1#',2)##lcase(get_ftp_credentials.upload_template)#">

				<!---I transfer a copy of that file to the /Uploaded_Files folder, --->
				<cfftp connection="ftp_#abbreviation#" action="getfile" stoponerror="yes" localfile="#GetDirectoryfromPath(GettemplatePath())#Uploaded_Files/#variables.archived_file_name#" remotefile="#variables.original_file_name#" transfermode="AUTO" failifexists="no">
				<p>Archiving '#variables.original_file_name#' to '#GetDirectoryfromPath(GettemplatePath())#Uploaded_Files/#variables.archived_file_name#'</p>

				<!---I log the original and new file names to LOG_Upload, --->
				<cfquery name="insert_log_upload" datasource="#application.datasources.main#">
				INSERT INTO LOG_Upload (original_file_name, archived_file_name, upload_source_id,
					data_fiscal_month, data_fiscal_year, created_by,
					created_date)
				SELECT '#variables.original_file_name#' AS original_file_name, '#variables.archived_file_name#' AS archived_file_name, #get_ftp_credentials.upload_source_id# AS upload_source_id /*#get_ftp_credentials.abbreviation#*/,
					date_month, MAX(fiscal_year) AS fiscal_year, 1 AS created_by,
					CURRENT_TIMESTAMP AS created_date
				FROM REF_Date
				WHERE date_month=EXTRACT(MONTH FROM CURRENT_TIMESTAMP+interval '1 month')
					AND date_year=EXTRACT(YEAR FROM CURRENT_TIMESTAMP-interval '1 month')
				GROUP BY date_month
				</cfquery>

				<!---then I kick off the relevant data factory process to retreive/process/delete the file from the FTP server.--->
				<cfquery name="execute_data_factory" datasource="#application.datasources.main#">
				EXECUTE msdb.dbo.sp_start_job N'FAAD_Import_#abbreviation#';
				</cfquery>
				<p>Kicked off 'FAAD_Import_#abbreviation#'</p>
				<cfset variables.datafactory_notification="#variables.datafactory_notification#FAAD started processing #abbreviation#. ">

			<cfelse>
				FILE IS NOT PRESENT.
			</cfif>
		<!---Close the ftp_#abbreviation# connection--->
		<p>CLOSING #abbreviation#</p>
		<cfftp connection="ftp_#abbreviation#" action="close" stoponerror="Yes">
	</cftransaction>
</cfoutput>

<!---If any processes are kicked off I email all users with access to regular maintenance that the feeds are being processed--->
<cfif len(variables.datafactory_notification)>
	<cfquery name="get_datafactory_distribution_list" datasource="#application.datasources.main#">
	SELECT Demographics.email_address
	FROM Access_User_Business_Function
		INNER JOIN Demographics ON Access_User_Business_Function.user_account_id=Demographics.user_account_id
			AND Demographics.active_ind=1
		INNER JOIN Link_User_Account_Status ON Access_User_Business_Function.user_account_id=Link_User_Account_Status.user_account_id
			AND Link_User_Account_Status.active_ind=1
			AND Link_User_Account_Status.account_status_id=1 /*active users only*/
	WHERE Access_User_Business_Function.active_ind=1
		AND Access_User_Business_Function.business_function_id=563 /*regular maintenance*/
		<cfif comparenocase(variables.environment_name, "Production")>AND Access_User_Business_Function.user_account_id=1</cfif>
	GROUP BY Demographics.email_address
	ORDER BY Demographics.email_address
	</cfquery>
	<cfif get_datafactory_distribution_list.recordcount>
		<cfoutput>
			<cfmail to="#valuelist(get_datafactory_distribution_list.email_address)#" from="#application.application_specific_settings.system_email_sender#" subject="FAAD Data Factory Notice" server="#application.email_server_name#">Please be aware: #variables.datafactory_notification#

You are receiving this message because you have access to the "Regular Maintenance" screen of the #application.product_name# system (https://#cgi.http_host##cgi.script_name#).</cfmail>
		</cfoutput>
	</cfif>
</cfif>	