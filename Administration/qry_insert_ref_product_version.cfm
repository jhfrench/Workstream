<!-- Administration/qry_insert_ref_product_version.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_product_version.cfm">
	<responsibilities>
		Query to insert a new product version into REF_Product_Version table.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="8/24/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_product_version" datasource="#application.datasources.main#">
INSERT INTO REF_Product_Version (description, selectable_ind, scheduled_release_date,
	created_by, active_ind, sort_order)
VALUES ('#attributes.description#', #attributes.selectable_ind#, '#dateformat(attributes.scheduled_release_date, "dd-mmm-yyyy")#',
	#session.user_account_id#, #attributes.active_ind#, #attributes.sort_order#)
</cfquery>