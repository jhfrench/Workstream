<!-- Administration/qry_deactivate_link_module_privilege.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_link_module_privilege.cfm">
	<responsibilities>
		Query to deactivate a record in Link_Module_Privilege table before a new insert.
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

<cfquery name="deactivate_link_module_privilege" datasource="#application.datasources.main#">
UPDATE Link_Module_Privilege
SET active_ind=0
WHERE active_ind=1
	AND l_m_p_id=#attributes.l_m_p_id#
</cfquery>