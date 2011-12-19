<!-- Administration/qry_insert_ref_numeric_multiplier.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_numeric_multiplier.cfm">
	<responsibilities>
		Query to insert a new record into REF_Numeric_Multiplier table.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/26/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="insert_ref_numeric_multiplier" datasource="#application.datasources.main#">
INSERT INTO REF_Numeric_Multiplier (description, divisor_to_1, numeric_format_mask,
	sort_order, created_by, active_ind)
VALUES ('#attributes.description#', #attributes.divisor_to_1#, '#attributes.numeric_format_mask#',
	#attributes.sort_order#, #session.user_account_id#, #attributes.active_ind#)
</cfquery>