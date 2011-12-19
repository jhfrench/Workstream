<!--- Administration/qry_deactivate_ref_product_service.cfm
	Author: Ping Liang--->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_product_service.cfm">
	<responsibilities>
		Query to deactivate a record in REF_product_service table before a new insert.
	</responsibilities>
	<properties>
		<history email="PLiang@nasa.gov" author="Ping Liang" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_product_service" datasource="#application.datasources.main#">
UPDATE REF_Product_Service
SET active_ind=0
WHERE active_ind=1
	AND product_service_id=#attributes.product_service_id#
</cfquery>
