<!-- Application_Manager/main/pag_hosting_network_overview.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="pag_hosting_network_overview.cfm" Specification="2.0">
	<responsibilities>
		I show the known network servers, organized by environment.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/25/2008" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfinclude template="qry_get_ref_environment.cfm">
<cfset variables.blue_code="00">
<cfset variables.red_code="00">

Click on a server to see what applications that server supports.
<br />
<table align="center" border="1" cellspacing="0" cellpadding="2" width="90%">
	<tr>
		<th bgcolor="#FF9900">
			Environment
		</th>
		<th bgcolor="#FF0000">
			Hosting Servers
		</th>
		<th bgcolor="#FF6600">
			Database Servers
		</th>
		<th bgcolor="#FFAA00">
			Email Servers
		</th>
	</tr>
<cfoutput query="qry_get_ref_environment">
	<tr>
		<th align="right" bgcolor="##FF99#variables.blue_code#" scope="row">
			#environment_name#
		</th>
		
		<cfquery name="qry_get_host_servers" datasource="#application.datasources.main#">
		SELECT Installation.environment_id, REF_Host_Server.host_server_id, REF_Host_Server.host_server_name
		FROM Installation
			INNER JOIN REF_Host_Server ON Installation.host_server_id=REF_Host_Server.host_server_id
		WHERE Installation.active_ind=1
			AND Installation.environment_id=#environment_id#
		GROUP BY Installation.environment_id, REF_Host_Server.host_server_name, REF_Host_Server.host_server_id
		ORDER BY REF_Host_Server.host_server_name
		</cfquery>
		<td align="center" bgcolor="##FF00#variables.blue_code#">
			<table>
				<tr>
			<cfloop query="qry_get_host_servers">
					<td align="center" bgcolor="##FF00#variables.blue_code#" valign="top">
						<p>&nbsp;</p>
						<a href="javascript:submit_form('REF_Host_Server',#host_server_id#);">
						<img src="main/web-server-icon.jpg" alt="#host_server_name#" width="48" height="48" border="0"><br />#host_server_name#
						</a>
						<p>&nbsp;</p>
					</td>
			</cfloop>
				</tr>
			</table>
		</td>
		
		<cfquery name="qry_get_database_servers" datasource="#application.datasources.main#">
		SELECT Installation.environment_id, REF_Database_Server.database_server_id, REF_Database_Server.database_server_name
		FROM Installation
			INNER JOIN L_Installation_Supporting_DB ON Installation.installation_id=L_Installation_Supporting_DB.installation_id
			INNER JOIN REF_Database_Server ON L_Installation_Supporting_DB.database_server_id=REF_Database_Server.database_server_id
		WHERE Installation.active_ind=1
			AND Installation.environment_id=#environment_id#
			AND L_Installation_Supporting_DB.active_ind=1
		GROUP BY Installation.environment_id, REF_Database_Server.database_server_id, REF_Database_Server.database_server_name
		ORDER BY REF_Database_Server.database_server_name
		</cfquery>
		<td align="center" bgcolor="##FF66#variables.blue_code#">
			<table>
				<tr>
			<cfloop query="qry_get_database_servers">
					<td align="center" bgcolor="##FF66#variables.blue_code#" valign="top">
						<p>&nbsp;</p>
						<a href="javascript:submit_form('REF_Database_Server',#database_server_id#);">
						<img src="main/data-server-icon.jpg" alt="#database_server_name#" width="48" height="48" border="0"><br />#database_server_name#
						</a>
						<p>&nbsp;</p>
					</td>
			</cfloop>
				</tr>
			</table>
		</td>
		
		<cfquery name="qry_get_email_servers" datasource="#application.datasources.main#">
		SELECT Installation.environment_id, REF_Email_Server.email_server_id, REF_Email_Server.email_server_name
		FROM Installation
			INNER JOIN REF_Email_Server ON Installation.email_server_id=REF_Email_Server.email_server_id
		WHERE Installation.active_ind=1
			AND Installation.environment_id=#environment_id#
			AND REF_Email_Server.email_server_id!=1
		GROUP BY Installation.environment_id, REF_Email_Server.email_server_id, REF_Email_Server.email_server_name
		ORDER BY REF_Email_Server.email_server_name
		</cfquery>
		<td align="center" bgcolor="##FFAA#variables.blue_code#">
			<table>
				<tr>
			<cfloop query="qry_get_email_servers">
					<td align="center" bgcolor="##FFAA#variables.blue_code#" valign="top">
						<p>&nbsp;</p>
						<a href="javascript:submit_form('REF_Email_Server',#email_server_id#);">
						<img src="main/email-server-icon.jpg" alt="#email_server_name#" width="48" height="48" border="0"><br />#email_server_name#
						</a>
						<p>&nbsp;</p>
					</td>
			</cfloop>
				</tr>
			</table>
		</td>
	</tr>
<cfset variables.blue_code=variables.blue_code+49>
</cfoutput>
</table>

<form name="form_hosting_network_overview" action="index.cfm?fuseaction=main.server_details" method="post">
	<input type="hidden" name="server_type" value="" />
	<input type="hidden" name="server_id" value="" />
</form>

<script language="javascript">
function submit_form(server_type, server_id) {
	document.forms.form_hosting_network_overview.server_type.value=server_type;
	document.forms.form_hosting_network_overview.server_id.value=server_id;
	document.forms.form_hosting_network_overview.submit();
}
</script>