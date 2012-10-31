<!-- Application_Manager/qry_get_valid_referer.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_valid_referer.cfm" Specification="2.0">
	<responsibilities>
		I retrieve list of referers from which we will accept incoming page requests.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="10/31/2012" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="get_valid_referer" datasource="Application_Manager">
SELECT SPLIT_PART(url_to_base, '/', 1) AS valid_referer
FROM Installation_URL
WHERE installation_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#application.installation_id#" />
</cfquery>
<cfif get_valid_referer.recordcount>
	<cfset application.valid_referer=valuelist(get_valid_referer.valid_referer)>
<cfelse>
	<p>Create Installation_URL records</p>
	<cfabort>
</cfif>
