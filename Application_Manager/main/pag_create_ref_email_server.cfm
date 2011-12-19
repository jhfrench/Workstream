<!-- Application_Manager/main/pag_create_ref_email_server.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="pag_create_ref_email_server.cfm" Specification="2.0">
	<responsibilities>
		I provide an interface for defining a new email server.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfform name="create_ref_email_server" action="index.cfm?fuseaction=main.insert_ref_email_server" method="post">
<table width="60%">
	<tr>
		<td width="50">Email server name</td>
		<td>
			<cfinput type="text" name="email_server_name" value="" maxlength="400" size="40" required="yes" message="Please enter the email server name.">
		</td>
	</tr>
	<tr>
		<td colspan="2" class="Forum_AltHeaderText"><input type="submit" value="Create new email server" /></td>
	</tr>
</table>
</cfform>
