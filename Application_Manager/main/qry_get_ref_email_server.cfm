<!-- Application_Manager/main/qry_get_ref_email_server.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_ref_email_server.cfm" Specification="2.0">
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

<cfquery name="qry_get_ref_email_server" datasource="#application.datasources.main#">
SELECT *
FROM REF_Email_Server
WHERE active_ind=1
ORDER BY sort_order
</cfquery>