<!-- Application_Manager/main/pag_create_support_contact_info.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="pag_create_support_contact_info.cfm" Specification="2.0">
	<responsibilities>
		I provide an interface for entering data about a new support contact.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfform name="create_support_contact_info" action="index.cfm?fuseaction=main.insert_support_contact_info" method="post">
<table width="60%">
	<tr>
		<td colspan="2" class="Forum_AltHeaderText">Support Contact</td>
	</tr>
	<tr>
		<td width="50">Contact type</td>
		<td>
			<cfselect name="support_contact_type_id" query="qry_get_ref_support_contact_type" value="support_contact_type_id" display="support_contact_type_name" required="yes" message="Please specify the contact type.">
			</cfselect>
		</td>
	</tr>
	<tr>
		<td width="50">Last name</td>
		<td>
			<cfinput type="text" name="last_name" value="" maxlength="400" size="40">
		</td>
	</tr>
	<tr>
		<td width="50">First name</td>
		<td>
			<cfinput type="text" name="first_name" value="" maxlength="400" size="40">
		</td>
	</tr>
	<tr>
		<td width="50">Phone</td>
		<td>
			<cfinput type="text" name="phone" value="" maxlength="400" size="40">
		</td>
	</tr>
	<tr>
		<td width="50">Email</td>
		<td>
			<cfinput type="text" name="email" value="" maxlength="400" size="40">
		</td>
	</tr>
	<tr>
		<td colspan="2" class="Forum_AltHeaderText"><input type="submit" value="Create new support contact" /></td>
	</tr>
</table>
</cfform>
