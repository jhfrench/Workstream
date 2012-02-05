<!-- Application_Manager/main/pag_create_ref_database_server.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="pag_create_ref_database_server.cfm" Specification="2.0">
	<responsibilities>
		I provide an interface for defining a new database server.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfform name="create_ref_database_server" action="index.cfm?fuseaction=main.insert_ref_database_server" method="post">
<table width="60%">
	<tr>
		<td width="50">Database server name</td>
		<td>
			<cfinput type="text" name="database_server_name" value="" maxlength="400" size="40" required="yes" message="Please enter the environment's name.">
		</td>
	</tr>
	<tr>
		<td colspan="2" class="Forum_AltHeaderText"><input type="submit" value="Create new database server" /></td>
	</tr>
</table>
</cfform>
