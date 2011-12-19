<!-- Application_Manager/main/pag_create_installation_step1.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="pag_create_installation_step1.cfm" Specification="2.0">
	<responsibilities>
		I collect basic details about a new installation of an existing product.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfform name="create_installation_step1" action="index.cfm?fuseaction=#variables.circuit_label#.create_installation_step2" method="post">
<table width="60%">
	<tr>
		<td colspan="2" class="Forum_AltHeaderText">Installation</td>
	</tr>
	<tr>
		<td width="50">Which product is being installed?</td>
		<td>
			<table>
				<tr>
					<td></td>
					<td>Name</td>
					<td>Date Created</td>
				</tr>
			<cfoutput query="qry_get_product">
				<tr>
					<td><cfinput type="radio" name="product_id" value="#product_id#" required="yes" message="Please specify the product being installed."></td>
					<td>#product_name#</td>
					<td>#date_created#</td>
				</tr>
			</cfoutput>
			</table>
		</td>
	</tr>
	<tr>
		<td width="50">Which environment is hosting the installation?</td>
		<td><cfselect name="environment_id" query="qry_get_ref_environment" display="environment_name" value="environment_id" required="yes" message="Please specify the environment which is hosting the installation."></cfselect></td>
	</tr>
	<tr>
		<td width="50">Which server is hosting the installation?</td>
		<td><cfselect name="host_server_id" query="qry_get_ref_host_server" display="host_server_name" value="host_server_id" required="yes" message="Please specify the server which is hosting the installation."></cfselect></td>
	</tr>
	<tr>
		<td width="50">Which email server is supporting the installation?</td>
		<td><cfselect name="email_server_id" query="qry_get_ref_email_server" display="email_server_name" value="email_server_id" required="yes" message="Please specify the email server which is supporting the installation."></cfselect></td>
	</tr>
	<tr>
		<td width="50">How many databases support the installation?</td>
		<td>
			<cfselect name="supporting_database_count" required="yes" message="Please specify the number of databases that support the installation.">
				<cfoutput>
				<cfloop from="1" to="10" index="database_count_ii">
					<option value="#database_count_ii#">#database_count_ii#</option>
				</cfloop>
				</cfoutput>
			</cfselect>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="Forum_AltHeaderText"><input type="submit" value="Proceed to next step" /></td>
	</tr>
</table>
</cfform>
