<!-- Application_Manager/main/qry_get_product.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_product.cfm" Specification="2.0">
	<responsibilities>
		I retrieve a list of the defined products.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_get_product" datasource="#application.datasources.main#">
SELECT product_id, product_name, date_created
FROM Product
ORDER BY product_name, date_created
</cfquery>