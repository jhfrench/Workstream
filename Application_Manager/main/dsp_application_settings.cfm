<!-- Application_Manager/main/dsp_application_settings.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="dsp_application_settings.cfm" Specification="2.0">
	<responsibilities>
		I dump the application structure so the user can see all the application variables and settings for Application_Manager.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_get_application_basic_details" datasource="#application.datasources.application_manager#">
<!--- /* Following query used to get CF application.name and other generic application variables. It is a cached query controlled by the Application_Manager tool. */ --->
SELECT Installation.installation_id, Installation.application_name, Installation.active_ind,
	Installation.error_handling_enabled_ind, Installation.log_page_request_ind, Installation_URL.url_to_base,
	Product.product_name,
	Product.browser_navigation_enabled_ind, Product.inactive_link, Product.product_id,
	Product.applicationtimeout, Product.clientmanagement, Product.clientstorage,
	Product.scriptprotect, Product.sessionmanagement, Product.sessiontimeout,
	Product.setclientcookies, Product.setdomaincookies, REF_Email_Server.email_server_name,
	REF_Environment.environment_name, REF_Host_Server.host_server_name
FROM Installation
	INNER JOIN Installation_URL ON Installation.installation_id=Installation_URL.installation_id
	INNER JOIN Product ON Installation.product_id=Product.product_id
	INNER JOIN Product_Version ON Installation.installation_id=Product_Version.installation_id
	INNER JOIN REF_Email_Server ON Installation.email_server_id=REF_Email_Server.email_server_id
	INNER JOIN REF_Environment ON Installation.environment_id=REF_Environment.environment_id
	INNER JOIN REF_Host_Server ON Installation.host_server_id=REF_Host_Server.host_server_id
WHERE Installation_URL.active_ind=1
	AND Product.active_ind=1
	AND Product_Version.active_ind=1
	AND Installation.product_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.product_id#">
ORDER BY REF_Environment.sort_order, REF_Host_Server.sort_order, Installation_URL.url_to_base
</cfquery>
Product details:
<cfoutput>
<table border="0" cellpadding="1" cellspacing="0">
	<tr>
		<th align="right" bgcolor="##669999" scope="row">product name</th><td bgcolor="##FFFFFF">#qry_get_application_basic_details.product_name#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">inactive_link</th><td bgcolor="##FFFFFF">#qry_get_application_basic_details.inactive_link#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">applicationtimeout</th><td bgcolor="##FFFFFF">#qry_get_application_basic_details.applicationtimeout#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">clientmanagement</th><td bgcolor="##FFFFFF">#qry_get_application_basic_details.clientmanagement#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">clientstorage</th><td bgcolor="##FFFFFF">#qry_get_application_basic_details.clientstorage#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">scriptprotect</th><td bgcolor="##FFFFFF">#qry_get_application_basic_details.scriptprotect#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">sessionmanagement</th><td bgcolor="##FFFFFF">#qry_get_application_basic_details.sessionmanagement#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">sessiontimeout</th><td bgcolor="##FFFFFF">#qry_get_application_basic_details.sessiontimeout#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">setclientcookies</th><td bgcolor="##FFFFFF">#qry_get_application_basic_details.setclientcookies#</td>
	</tr>
	<tr>
		<th align="right" bgcolor="##669999" scope="row">setdomaincookies</th><td bgcolor="##FFFFFF">#qry_get_application_basic_details.setdomaincookies#</td>
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
<cfoutput query="qry_get_application_basic_details">
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