<!-- Administration/qry_deactivate_ref_privilege.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_privilege.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Privilege table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="deactivate_ref_privilege" datasource="#application.datasources.main#">
UPDATE REF_Privilege
SET active_ind=0
WHERE active_ind=1
	AND privilege_id=#attributes.privilege_id#
</cfquery>