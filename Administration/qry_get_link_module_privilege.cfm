<!-- Administration/qry_get_link_module_privilege.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_link_module_privilege.cfm">
	<responsibilities>
		Query to get link module privilege.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/9/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.l_m_p_id" default="0">
<cfquery name="get_link_module_privilege" datasource="#application.datasources.main#">
SELECT l_m_p_id, module_id, privilege_id
FROM Link_Module_Privilege
WHERE <cfif attributes.l_m_p_id NEQ 0>l_m_p_id=#attributes.l_m_p_id#<cfelse>active_ind=1</cfif>
ORDER BY module_id, privilege_id
</cfquery>