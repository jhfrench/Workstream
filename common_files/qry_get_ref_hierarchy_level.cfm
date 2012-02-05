<!-- common_files/qry_get_ref_hierarchy_level.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_hierarchy_level.cfm">
	<responsibilities>
		I get the records from REF_Hierarchy_Level table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.hierarchy_level_id" default="0">
<cfquery name="get_ref_hierarchy_level" datasource="#application.datasources.main#">
SELECT hierarchy_level_id, description, sort_order, center_ind
FROM REF_Hierarchy_Level
WHERE <cfif attributes.hierarchy_level_id NEQ 0>hierarchy_level_id=#attributes.hierarchy_level_id#<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_hierarchy_level=get_ref_hierarchy_level>
