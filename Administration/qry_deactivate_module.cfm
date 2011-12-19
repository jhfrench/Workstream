<!-- Administration/qry_deactivate_module.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_module.cfm">
	<responsibilities>
		I deactivate module before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="8/9/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_module" datasource="#application.datasources.main#">
UPDATE Lock_Module
SET active_ind=0
WHERE active_ind=1
	AND module_id IN (#attributes.module_id_list#)
</cfquery>
