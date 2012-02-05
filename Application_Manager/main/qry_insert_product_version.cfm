<!-- Application_Manager/main/qry_insert_product_version.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_insert_product_version.cfm" Specification="2.0">
	<responsibilities>
		I insert new records into the Product_Version table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_insert_product_version" datasource="#application.datasources.main#">
INSERT INTO Product_Version (installation_id, product_release_version, subversion_release_version,
	date_created, active_ind)
SELECT #attributes.installation_id#, '#attributes.product_release_version#', '#attributes.subversion_release_version#',
	GETDATE(), 1
FROM Dual
</cfquery>