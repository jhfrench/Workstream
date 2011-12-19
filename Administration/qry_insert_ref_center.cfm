<!-- Administration/qry_insert_ref_center.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_center.cfm">
	<responsibilities>
		Query to insert a new center.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="8/16/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_center" datasource="#application.datasources.main#">
INSERT INTO REF_Center (description, center_code, abbreviation,
	sort_order, created_by, active_ind)
VALUES ('#attributes.description#', '#attributes.center_code#', '#attributes.abbreviation#',
	#attributes.sort_order#, #session.user_account_id#, #attributes.active_ind#)
</cfquery>