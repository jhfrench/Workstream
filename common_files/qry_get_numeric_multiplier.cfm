<!-- common_files/qry_get_numeric_multiplier.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_numeric_multiplier.cfm">
	<responsibilities>
		I retrieve numeric multiplier from REF_Numeric_Multiplier table.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/21/2007" role="FuseCoder" comments="Created File">
			$Id:$
			modified 6/27/2007 by LK
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
<cfparam name="attributes.numeric_multiplier_id" default="0">
<cfquery name="get_numeric_multiplier" datasource="#application.datasources.main#">
SELECT numeric_multiplier_id, description, divisor_to_1,
	numeric_format_mask, active_ind
FROM REF_Numeric_Multiplier
WHERE <cfif attributes.numeric_multiplier_id NEQ 0>numeric_multiplier_id=#attributes.numeric_multiplier_id#<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_numeric_multiplier=get_numeric_multiplier>