<!-- Application_Manager/main/qry_get_ref_environment.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_ref_environment.cfm" Specification="2.0">
	<responsibilities>
		I retrieve a list of the different application environments.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_get_ref_environment" datasource="#application.datasources.application_manager#">
SELECT *
FROM REF_Environment
WHERE active_ind=1
ORDER BY sort_order
</cfquery>