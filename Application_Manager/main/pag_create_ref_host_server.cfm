<!-- Application_Manager/main/pag_create_ref_host_server.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="pag_create_ref_host_server.cfm" Specification="2.0">
	<responsibilities>
		I provide an interface for defining a server that can host (or serve) an application.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfform name="create_ref_host_server" action="index.cfm?fuseaction=main.insert_ref_host_server" method="post">
<table width="60%">
	<tr>
		<td width="50">Host (web) server name</td>
		<td>
			<cfinput type="text" name="host_server_name" value="" maxlength="400" size="40" required="yes" message="Please enter the environment's name.">
		</td>
	</tr>
	<tr>
		<td colspan="2" class="Forum_AltHeaderText"><input type="submit" value="Create new host server" /></td>
	</tr>
</table>
</cfform>
