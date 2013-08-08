<!-- Application_Manager/qry_get_application_basic_details.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_application_basic_details.cfm" Specification="2.0">
	<responsibilities>
		I am one of the most important queries used by the Application_Manager system. I retrieve a wealth of details about a given installation as identified by the URL used to access the product.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
		$Id$
		</history>
	</properties>
</fusedoc>
--->
<cfscript>
	variables.url_to_base=cgi.http_host;
	if (len(variables.url_base_suffix)) {
		variables.url_to_base="#variables.url_to_base##variables.url_base_suffix#";
	}
</cfscript>
<!--- Following query used to get CF application.name and other generic application variables. It is a cached query controlled by the Application_Manager tool. Determine which installation's records we should pull based on the URL through which the user acesses the system--->
<cfquery name="get_application_basic_details" cachedwithin="#createtimespan(30, 0, 0, 0)#" datasource="Application_Manager">
SELECT *
FROM Get_Application_Basic_Details(<cfqueryparam value="#variables.application_last_updated#" cfsqltype="cf_sql_timestamp" />, <cfqueryparam value="#variables.url_to_base#" cfsqltype="cf_sql_varchar" />);
</cfquery>
