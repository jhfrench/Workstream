<!-- Application_Manager/main/qry_insert_product.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_insert_product.cfm" Specification="2.0">
	<responsibilities>
		I insert new records into the Product table.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_insert_product" datasource="#application.datasources.main#">
INSERT INTO Product (product_name, browser_navigation_enabled_ind, inactive_link,
	date_created, active_ind)
SELECT '#attributes.product_name#', #attributes.browser_navigation_enabled_ind#, '#attributes.inactive_link#',
	GETDATE(), 1
FROM Dual
</cfquery>