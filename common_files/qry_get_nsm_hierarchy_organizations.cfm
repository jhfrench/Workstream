<!-- common_files/qry_get_nsm_hierarchy_organizations.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_nsm_hierarchy_organizations.cfm">
	<responsibilities>
		I get the meta-data that describes the different groupers that make up the NSM structure for the specified program year.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/21/2007" role="FuseCoder" comments="Created File">
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
<cfsetting requesttimeout="30000">
<cfquery name="get_nsm_hierarchy_organizations" datasource="#application.datasources.main#">
	<cfinclude template="sql_get_nsm_hierarchy_organizations.cfm">
</cfquery>
<cfset caller.get_nsm_hierarchy_organizations=get_nsm_hierarchy_organizations>