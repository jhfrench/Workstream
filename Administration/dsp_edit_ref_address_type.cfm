<!-- Administration/pag_edit_ref_priority.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_address_type.cfm">
	<responsibilities>
		I display the form for editing priority and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>

		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->

<cfparam name="attributes.method" default="">
<cfmodule template="qry_get_ref_address_type.cfm" address_type_id="0">
<cfoutput>
<form name="edit_ref_address_type_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="address_type_id">
	<cfloop query="get_ref_address_type"><option value="#address_type_id#" <cfif not comparenocase(get_ref_address_type.address_type_id, attributes.address_type_id)>selected</cfif>>#description#</option></cfloop>
	</select>
	<input name="method" type="submit" alt="Retrieve and edit Address Type" value="Retrieve and Edit Address Type"/>
</form>
<cfif len(attributes.method)>
	<cfmodule template="qry_get_ref_address_type.cfm" address_type_id="#attributes.address_type_id#">
	<cfset attributes.description=get_ref_address_type.description>
	<cfset attributes.address_type_id=get_ref_address_type.address_type_id>
</cfif>
<cfform name="REF_address_type_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999" title="table head describes the data held in the table within this table">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Table displays user account information">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.address_type_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> Address Type</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="table displays user account information">
			<tr>
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" size="30" value="#attributes.description#" required="yes" tabindex="1" message="Please enter description." maxlength="400">
				</td>
				<td><label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value="#iif(attributes.address_type_id EQ 0, ('get_ref_address_type.recordcount+1'), ('get_ref_address_type.sort_order'))#" size="3" maxlength="3" required="yes" tabindex="2" validate="integer" message="Please enter sort order." />
				</td>
				<cfif attributes.address_type_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
				<cfelse>
				<td colspan="2"><span title="describes the purpose of the radio buttons that follow">Active?</span>
					<br /><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes </label>
				 		<cfinput type="radio" name="active_ind" id="active_ind_no" value="0" ><label for="active_ind_no">No </label>
				</td>
				</cfif>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="created_by" value="#session.user_account_id#"/>
			<input type="hidden" name="address_type_id" value="#attributes.address_type_id#"/>
			<input type="submit" alt="submit" value="Submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
