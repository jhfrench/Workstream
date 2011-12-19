<!-- Administration/qry_deactivate_link_module_privilege.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_link_module_privilege.cfm">
	<responsibilities>
		Query to deactivate a record in Link_Module_Privilege table before a new insert.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="7/9/2007" role="FuseCoder" comments="Created File">
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