<!-- common_files/qry_get_ref_resource_link_type.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_resource_link_type.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/27/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.resource_link_type_id" default="0">

<cfquery name="get_ref_resource_link_type_count" datasource="#application.datasources.main#">
SELECT count(*) AS count1
FROM REF_Resource_Link_Type
WHERE active_ind=1
</cfquery>

<cfquery name="get_ref_resource_link_type" datasource="#application.datasources.main#">
SELECT resource_link_type_id, description, sort_order
FROM REF_Resource_Link_Type
WHERE <cfif attributes.resource_link_type_id NEQ 0>resource_link_type_id=#attributes.resource_link_type_id#<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_resource_link_type=get_ref_resource_link_type>