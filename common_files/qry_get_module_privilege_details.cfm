<!-- common_files/qry_get_module_privilege_details.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_module_privilege_details.cfm">
	<responsibilities>
		I get the meta-data that describes the different groupers that make up the NSM structure for the specified program year.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
			attributes.module_id: id of the module you're working with
			attributes.exclude_privilege_id: list of ids for any privileges you don't want the query to return, for whatever reason
		</in>
		<passthrough>
		</passthrough>
		<out>
		</out>
	</IO>
</fusedoc>
--->

<cfparam name="attributes.exclude_privilege_id" default="">
<cfparam name="attributes.module_id" default="0">

<cfquery name="get_module_privilege_details" datasource="#application.datasources.main#">
SELECT REF_Module.description AS module_description, REF_Privilege.privilege_id, REF_Privilege.description AS privilege_label
FROM REF_Module
	INNER JOIN Link_Module_Privilege ON REF_Module.module_id=Link_Module_Privilege.module_id
	INNER JOIN REF_Privilege ON Link_Module_Privilege.privilege_id=REF_Privilege.privilege_id
WHERE Link_Module_Privilege.active_ind=1
	AND REF_Privilege.active_ind=1<cfif attributes.module_id NEQ 0>
	AND Link_Module_Privilege.module_id=#attributes.module_id#</cfif><cfif len(attributes.exclude_privilege_id)>
	AND Link_Module_Privilege.privilege_id NOT IN (#attributes.exclude_privilege_id#)</cfif>
ORDER BY REF_Privilege.sort_order, REF_Module.sort_order
</cfquery>
<cfif get_module_privilege_details.recordcount EQ 0>
	<cfset variables.relevant_privileges=0>
<cfelse>
	<cfset variables.relevant_privileges=valuelist(get_module_privilege_details.privilege_id)>
</cfif>