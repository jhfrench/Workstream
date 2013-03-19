<!-- Application_Manager/main/dsp_application_settings.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="dsp_application_settings.cfm" Specification="2.0">
	<responsibilities>
		I dump the application structure so the user can see all the application variables and settings for Application_Manager.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="get_application_settings" datasource="#application.datasources.application_manager#">
SELECT Installation.installation_id, Installation.application_name, Installation.active_ind,
	Installation.error_handling_enabled_ind, Installation.log_page_request_ind, Installation.system_email_sender,
	Product.product_name, Product.browser_navigation_enabled_ind, Product.inactive_link,
	Product.product_id, Product.applicationtimeout, Product.clientmanagement,
	Product.clientstorage, Product.scriptprotect, Product.sessionmanagement,
	Product.sessiontimeout, Product.setclientcookies, Product.setdomaincookies,
	Product_Version.product_release_version, REF_Environment.environment_name, REF_Host_Server.host_server_name,
	REF_Email_Server.email_server_name, REF_Email_Server.email_port, REF_Email_Server.email_username,
	REF_Email_Server.email_password, REF_Email_Server.email_usessl, REF_Email_Server.email_usetls
FROM Installation_URL
	INNER JOIN Installation ON Installation_URL.installation_id=Installation.installation_id
		AND Installation.active_ind=1
		AND Installation.product_id=<cfqueryparam value="#attributes.product_id#" cfsqltype="cf_sql_integer">
	INNER JOIN Product ON Installation.product_id=Product.product_id
		AND Product.active_ind=1
	INNER JOIN Product_Version ON Installation.installation_id=Product_Version.installation_id
		AND Product_Version.active_ind=1
	INNER JOIN REF_Email_Server ON Installation.email_server_id=REF_Email_Server.email_server_id
	INNER JOIN REF_Environment ON Installation.environment_id=REF_Environment.environment_id
	INNER JOIN REF_Host_Server ON Installation.host_server_id=REF_Host_Server.host_server_id
WHERE Installation_URL.active_ind=1
ORDER BY REF_Environment.sort_order, REF_Host_Server.sort_order, Installation_URL.url_to_base
</cfquery>
Product details:
<cfoutput>
<table border="0" cellpadding="1" cellspacing="0">
	<tr>
		<th align="right" bgcolor="##669999" scope="row">product name</th><td bgcolor="##FFFFFF">#get_application_settings.product_name#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">inactive_link</th><td bgcolor="##FFFFFF">#get_application_settings.inactive_link#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">applicationtimeout</th><td bgcolor="##FFFFFF">#get_application_settings.applicationtimeout#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">clientmanagement</th><td bgcolor="##FFFFFF">#get_application_settings.clientmanagement#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">clientstorage</th><td bgcolor="##FFFFFF">#get_application_settings.clientstorage#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">scriptprotect</th><td bgcolor="##FFFFFF">#get_application_settings.scriptprotect#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">sessionmanagement</th><td bgcolor="##FFFFFF">#get_application_settings.sessionmanagement#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">sessiontimeout</th><td bgcolor="##FFFFFF">#get_application_settings.sessiontimeout#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">setclientcookies</th><td bgcolor="##FFFFFF">#get_application_settings.setclientcookies#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">setdomaincookies</th><td bgcolor="##FFFFFF">#get_application_settings.setdomaincookies#</td>
	</tr>
</table>
</cfoutput>
<hr />
<table>
	<tr>
		<th>environment_name</th>
		<th>url_to_base</th>
		<th>host_server_name</th>
		<th>email_server_name</th>
		<th>installation_id</th>
		<th>application_name</th>
		<th>installation active_ind</th>
		<th>error_handling_enabled_ind</th>
		<th>log_page_request_ind</th>
	</tr>
<cfoutput query="get_application_settings">
	<tr bgcolor="##<cfif currentrow MOD 2>66CC66<cfelse>FFFFFF</cfif>">
		<td valign="top"><a name="#installation_id#">#environment_name#</a></td>
		<td valign="top"><a href="http://#url_to_base#">#url_to_base#</a></td>
		<td valign="top">#host_server_name#</td>
		<td valign="top">#email_server_name#</td>
		<td valign="top">#installation_id#</td>
		<td valign="top">#application_name#</td>
		<td valign="top">#active_ind#</td>
		<td valign="top">#error_handling_enabled_ind#</td>
		<td valign="top">#log_page_request_ind#</td>
	</tr>
</cfoutput>
</table>
<hr />