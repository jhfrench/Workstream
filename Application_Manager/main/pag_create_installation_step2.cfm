<!-- Application_Manager/main/pag_create_installation_step2.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="pag_create_installation_step2.cfm" Specification="2.0">
	<responsibilities>
		I provide an interface for defining an installation. I add more advanced installation details to the basic details we collected in step 1. All these details are then passed to the insert function.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfform name="create_installation_step2" action="index.cfm?fuseaction=main.insert_installation" method="post">
<table width="60%">
	<tr>
		<td colspan="2" class="Forum_AltHeaderText">Installation</td>
	</tr>
	<tr>
		<td width="50">URL to application base (no http prefix, ie: intranet.hq.nasa.gov/FHDS)</td>
		<td>
			<cfinput type="text" name="url_to_base" size="40" maxlength="400" required="yes" message="Please specify the application's base URL.">
		</td>
	</tr>
	<tr>
		<td width="50">What databases support this application?</td>
		<td>
			<table>
				<tr>
					<td>Database name</td>
					<td>CF Dasource name</td>
					<td>Database description</td>
					<td>Server that hosts the database</td>
				</tr>
				<cfoutput>
				<cfloop from="1" to="#attributes.supporting_database_count#" index="database_count_ii">
					<td><cfinput type="text" name="database_name_#database_count_ii#"  maxlength="400" required="yes" message=""></td>
					<td><cfinput type="text" name="datasource_name_#database_count_ii#"  maxlength="400" required="yes" message=""></td>
					<td><cfinput type="text" name="datasource_description_#database_count_ii#"  maxlength="400" required="yes" message=""></td>
					<td><cfselect name="database_server_id_#database_count_ii#" query="qry_get_ref_database_server" value="database_server_id" display="database_server_name"></cfselect></td>
				</cfloop>
				</cfoutput>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="Forum_AltHeaderText">Product version details</td>
	</tr>
	<tr>
		<td width="50">Application version number</td>
		<td>
			<cfinput type="text" name="product_release_version" size="5" maxlength="400" required="yes" message="Please specify the release version.">
		</td>
	</tr>
	<tr>
		<td width="50">Subversion check-in number</td>
		<td>
			<cfinput type="text" name="subversion_release_version" size="5" maxlength="400" required="yes" message="Please specify the current subversion number.">
		</td>
	</tr>
<cfif qry_get_support_contact_info.recordcount NEQ 0>
<!--- If some contacts are already listed in the Support_Contact_Info table, show them here so the user can assign them to the installation --->
	<tr>
		<td colspan="2" class="Forum_AltHeaderText">Product support contacts</td>
	</tr>
	<tr>
		<td width="50">
			Check the different contacts who will support this installation and modify the details as necessary.
		</td>
		<td>
			<table>
				<tr>
					<td></td>
					<td>Contact</td>
					<td>Contact Type</td>
				</tr>
			<cfoutput query="qry_get_support_contact_info">
				<tr>
					<td><input type="checkbox" name="support_contact_info_id" value="#support_contact_info_id#" /></td>
					<td>#contact_name#</td>
					<td>#support_contact_type_name#</td>
				</tr>
			</cfoutput>
			</table>
		</td>
	</tr>
<cfelse>
<!--- Otherwise, we need a hidden field to be a place-holder (it makes the insert logic easier because we know no assignments were elected). --->
	<input type="hidden" name="support_contact_id" value="" />
</cfif>
	<tr>
		<td colspan="2" class="Forum_AltHeaderText">
		<cfoutput>
			<input type="hidden" name="product_id" value="#attributes.product_id#" />
			<input type="hidden" name="environment_id" value="#attributes.environment_id#" />
			<input type="hidden" name="host_server_id" value="#attributes.host_server_id#" />
			<input type="hidden" name="email_server_id" value="#attributes.email_server_id#" />
			<input type="hidden" name="supporting_database_count" value="#attributes.supporting_database_count#" />
		</cfoutput>
			<input type="submit" value="Create new installation record" />
		</td>
	</tr>
</table>
</cfform>
