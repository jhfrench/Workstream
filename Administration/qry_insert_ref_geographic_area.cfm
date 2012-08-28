<!--- Administration/qry_insert_ref_geographic_area.cfm
	Author: Jeromy French--->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_geographic_area.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/7/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_geographic_area" datasource="#application.datasources.main#">
INSERT INTO REF_geographic_area (description, code, sort_order, 
	created_by, active_ind)
VALUES ('#attributes.description#', '#attributes.code#', #attributes.sort_order#, 
	#variables.user_identification#, #attributes.active_ind#)
</cfquery>