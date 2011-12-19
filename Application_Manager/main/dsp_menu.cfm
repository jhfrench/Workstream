<!-- Application_Manager/main/dsp_menu.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="dsp_menu.cfm" Specification="2.0">
	<responsibilities>
		I show the user a menu of possible actions.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<table>
	<tr>
		<td class="Forum_AltHeaderText"><a href="index.cfm?fuseaction=main.create_product">Define new product</a></td>
		<td>Use the wizard to define a new product</td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText"><a href="index.cfm?fuseaction=main.create_installation_step1">Create new intallation for an existing product</a></td>
		<td>Use the wizard to define the different settings a new installation needs</td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText"><a href="index.cfm?fuseaction=main.create_ref_database_server">Add a new database server</a></td>
		<td></td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText"><a href="index.cfm?fuseaction=main.create_ref_email_server">Add a new email server</a></td>
		<td></td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText"><a href="index.cfm?fuseaction=main.create_ref_environment">Add a new environment</a></td>
		<td></td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText"><a href="index.cfm?fuseaction=main.create_ref_host_server">Add a new host (web) server</a></td>
		<td></td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText"><a href="index.cfm?fuseaction=main.create_support_contact_info">Add a new support contact member</a></td>
		<td></td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText"><a href="index.cfm?fuseaction=main.create_ref_support_contact_type">Add a new support contact type</a></td>
		<td></td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText"><a href="index.cfm?fuseaction=main.application_settings">View existing intallation settings</a></td>
		<td>View the application settings for a current installation</td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText"><a href="index.cfm?fuseaction=main.edit_installation">Edit existing intallation settings</a></td>
		<td>Edit the application settings for a current installation</td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText"><a href="index.cfm?fuseaction=main.view_error_diagnostics">View error diagnostics</a></td>
		<td>Shows error details</td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText"><a href="index.cfm?fuseaction=main.reports">Reports</a></td>
		<td>View trending, benchmarking and rate reports by application for page hits and errors.</td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText"><a href="index.cfm?fuseaction=main.hosting_network_overview">Hosting Network</a></td>
		<td>View hosting network details.</td>
	</tr>
</table>
