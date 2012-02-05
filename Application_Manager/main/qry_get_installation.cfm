<!-- Application_Manager/main/qry_get_installation.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_installation.cfm" Specification="2.0">
	<responsibilities>
		I retrieve a list of the email servers used to support email functionality for the different systems.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_get_installation" datasource="#application.datasources.main#">
SELECT *
FROM Installation
WHERE active_ind=1
</cfquery>