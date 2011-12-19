<!-- Application_Manager/main/pag_create_ref_support_contact_type.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="pag_create_ref_support_contact_type.cfm" Specification="2.0">
	<responsibilities>
		I provide an interface for defining a new type of support contact.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfform name="create_ref_support_contact_type" action="index.cfm?fuseaction=main.insert_ref_support_contact_type" method="post">
<table width="60%">
	<tr>
		<td width="50">Current support contact types</td>
		<td>
			<ul>
				<cfoutput query="qry_get_ref_support_contact_type">
				<li>#support_contact_type_name#</li>
				</cfoutput>
			</ul>
		</td>
	</tr>
	<tr>
		<td width="50">New support contact type</td>
		<td>
			<cfinput type="text" name="support_contact_type_name" value="" maxlength="400" size="40" required="yes" message="Please enter the support contact type.">
		</td>
	</tr>
	<tr>
		<td colspan="2" class="Forum_AltHeaderText"><input type="submit" value="Create new support contact type" /></td>
	</tr>
</table>
</cfform>
