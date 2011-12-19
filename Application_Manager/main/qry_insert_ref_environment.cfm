<!-- Application_Manager/main/qry_insert_ref_environment.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_insert_ref_environment.cfm" Specification="2.0">
	<responsibilities>
		I insert new records into the REF_Environment table.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_insert_ref_environment" datasource="#application.datasources.main#">
INSERT INTO REF_Environment (environment_name, sort_order)
VALUES ('#attributes.environment_name#', 1)
</cfquery>