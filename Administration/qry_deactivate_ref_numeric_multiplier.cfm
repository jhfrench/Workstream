<!-- Administration/qry_deactivate_ref_numeric_multiplier.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_numeric_multiplier.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Numeric_Multiplier table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/26/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_numeric_multiplier" datasource="#application.datasources.main#">
UPDATE REF_Numeric_Multiplier
SET active_ind=0
WHERE active_ind=1
	AND numeric_multiplier_id=#attributes.numeric_multiplier_id#
</cfquery>
