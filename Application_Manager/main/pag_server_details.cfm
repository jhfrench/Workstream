<!-- Application_Manager/main/pag_server_details.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="pag_server_details.cfm" Specification="2.0">
	<responsibilities>
		I show the known network servers, organized by environment.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/25/2008" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->



<cfswitch expression="#attributes.server_type#">
	<cfcase value="REF_Host_Server">
		<cfquery name="qry_get_host_servers" datasource="#application.datasources.main#">
		SELECT Installation.installation_id, Installation.product_id, REF_Host_Server.host_server_name,
			Product.product_name
		FROM Installation
			INNER JOIN REF_Host_Server ON Installation.host_server_id=REF_Host_Server.host_server_id
			INNER JOIN Product ON Installation.product_id=Product.product_id
			INNER JOIN (
				SELECT installation_id
				FROM Installation_URL
				WHERE active_ind=1
				GROUP BY installation_id
			) Installation_URL ON Installation.installation_id=Installation_URL.installation_id
		WHERE Installation.active_ind=1
			AND REF_Host_Server.host_server_id=#attributes.server_id#
		GROUP BY Installation.installation_id, Installation.product_id, REF_Host_Server.host_server_name,
			Product.product_name
		ORDER BY Product.product_name
		</cfquery>
		<div align="center">
		<cfoutput>
			<img src="main/web-server-icon.jpg" width="48" height="48" border="0">
			<br />#qry_get_host_servers.host_server_name# Applications:
		</cfoutput>
		<cfoutput query="qry_get_host_servers">
			<br /><a href="javascript:submit_form(#product_id#, #installation_id#)">#product_name#</a>
		</cfoutput>
		</div>
	</cfcase>
	<cfcase value="REF_Database_Server">
		<cfquery name="qry_get_database_servers" datasource="#application.datasources.main#">
		SELECT Installation.installation_id, Installation.product_id, REF_Database_Server.database_server_name,
			Product.product_name
		FROM Installation
			INNER JOIN L_Installation_Supporting_DB ON Installation.installation_id=L_Installation_Supporting_DB.installation_id
			INNER JOIN REF_Database_Server ON L_Installation_Supporting_DB.database_server_id=REF_Database_Server.database_server_id
			INNER JOIN Product ON Installation.product_id=Product.product_id
			INNER JOIN (
				SELECT installation_id
				FROM Installation_URL
				WHERE active_ind=1
				GROUP BY installation_id
			) Installation_URL ON Installation.installation_id=Installation_URL.installation_id
		WHERE Installation.active_ind=1
			AND REF_Database_Server.database_server_id=#attributes.server_id#
			AND L_Installation_Supporting_DB.active_ind=1
		GROUP BY Installation.installation_id, Installation.product_id, REF_Database_Server.database_server_name,
			Product.product_name
		ORDER BY Product.product_name
		</cfquery>
		<div align="center">
		<cfoutput>
			<img src="main/data-server-icon.jpg" width="48" height="48" border="0">
			<br />#qry_get_database_servers.database_server_name# Applications:
		</cfoutput>
		<cfoutput query="qry_get_database_servers">
			<br /><a href="javascript:submit_form(#product_id#, #installation_id#)">#product_name#</a>
		</cfoutput>
		</div>
	</cfcase>
	<cfcase value="REF_Email_Server">
		<cfquery name="qry_get_email_servers" datasource="#application.datasources.main#">
		SELECT Installation.installation_id, Installation.product_id, REF_Email_Server.email_server_name,
			Product.product_name
		FROM Installation
			INNER JOIN REF_Email_Server ON Installation.email_server_id=REF_Email_Server.email_server_id
			INNER JOIN Product ON Installation.product_id=Product.product_id
			INNER JOIN (
				SELECT installation_id
				FROM Installation_URL
				WHERE active_ind=1
				GROUP BY installation_id
			) Installation_URL ON Installation.installation_id=Installation_URL.installation_id
		WHERE Installation.active_ind=1
			AND REF_Email_Server.email_server_id=#attributes.server_id#
		GROUP BY Installation.installation_id, Installation.product_id, REF_Email_Server.email_server_name,
			Product.product_name
		ORDER BY Product.product_name
		</cfquery>
		<div align="center">
		<cfoutput>
			<img src="main/email-server-icon.jpg" width="48" height="48" border="0">
			<br />#qry_get_email_servers.email_server_name# Applications:
		</cfoutput>
		<cfoutput query="qry_get_email_servers">
			<br /><a href="javascript:submit_form(#product_id#, #installation_id#)">#product_name#</a>
		</cfoutput>
		</div>
	</cfcase>
</cfswitch>

<p><a href="index.cfm?fuseaction=main.server_details">Return to Network Diagram</a></p>

<form name="form_server_details" action="index.cfm?fuseaction=main.application_settings" method="post">
	<input type="hidden" name="product_id" value="" />
</form>

<script language="javascript">
function submit_form(product_id, installation_id) {
	document.forms.form_server_details.product_id.value=product_id;
	document.forms.form_server_details.action='index.cfm?fuseaction=main.application_settings#'+installation_id;
	document.forms.form_server_details.submit();
}
</script>


