<!-- Application_Manager/qry_get_application_basic_details.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_application_basic_details.cfm" Specification="2.0">
	<responsibilities>
		I am one of the most important queries used by the Application_Manager system. I retrieve a wealth of details about a given installation as identified by the URL used to access the product.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
		$Id$
		</history>
	</properties>
</fusedoc>
--->
<cfset variables.url_to_base=cgi.http_host>
<cfif len(variables.url_base_suffix)>
	<cfset variables.url_to_base="#variables.url_to_base##variables.url_base_suffix#">
</cfif>

<!--- Determine which installation's records we should pull based on the URL through which the user acesses the system--->
<cfquery name="qry_get_application_basic_details" cachedafter="02/02/1978" datasource="#application.datasources.main#">
<!--- /* Following query used to get CF application.name and other generic application variables. It is a cached query controlled by the Application_Manager tool. */ --->
SELECT Installation.installation_id, Installation.application_name, Installation.active_ind,
	Installation.error_handling_enabled_ind, Installation.log_page_request_ind, Product.product_name,
	Product.browser_navigation_enabled_ind, Product.inactive_link, Product.product_id,
	Product.applicationtimeout, Product.clientmanagement, Product.clientstorage,
	Product.scriptprotect, Product.sessionmanagement, Product.sessiontimeout,
	Product.setclientcookies, Product.setdomaincookies, Product_Version.product_release_version,
	REF_Email_Server.email_server_name, REF_Environment.environment_name, REF_Host_Server.host_server_name
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
	AND #variables.application_last_updated#=#variables.application_last_updated# /* date comes from Last_Updated.last_updated in Application_Manager */
	AND Installation_URL.url_to_base=<cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.url_to_base#">
</cfquery>
