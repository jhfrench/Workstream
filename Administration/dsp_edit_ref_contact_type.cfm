<!-- Administration/pag_edit_ref_priority.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_contact_type.cfm">
	<responsibilities>
		I display the form for editing priority and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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
<cfmodule template="qry_get_ref_contact_type.cfm" contact_type_id="0">
<cfoutput>
<form name="edit_ref_contact_type_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="contact_type_id">
	<cfloop query="get_ref_contact_type"><option value="#contact_type_id#"<cfif NOT comparenocase(get_ref_contact_type.contact_type_id, attributes.contact_type_id)> selected="selected"</cfif>>#description#</option></cfloop>
	</select>
	<input type="submit" name="method" alt="Retrieve and edit Contact Type" value="Retrieve and edit Contact Type" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="qry_get_ref_contact_type.cfm" contact_type_id="#attributes.contact_type_id#">
	<cfset attributes.description=get_ref_contact_type.description>
	<cfset attributes.sort_order=get_ref_contact_type.sort_order>
	<cfset attributes.contact_type_id=get_ref_contact_type.contact_type_id>
</cfif>
<cfform name="REF_contact_type_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999" title="table head describes the data held in the table within this table">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Table displays user account information">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.contact_type_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> contact type </strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="table displays user account information">
			<tr>
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" size="30" value="#attributes.description#" required="yes" message="Please enter description." maxlength="400">
				</td>
				<td>
					<label for="sort_order">Sort Order</label>: 
					<br />
					<input type="number" name="sort_order" id="sort_order" value= "#IIf(attributes.contact_type_id EQ 0, ('get_ref_contact_type.recordcount+1'), ('get_ref_contact_type.sort_order'))#" step="1" min="1" required="required" class="span5" />
				</td>
				<cfif attributes.contact_type_id EQ 0>
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
		<td class="btn-group">
			<input type="hidden" name="created_by" value="#variables.user_identification#" />
			<input type="hidden" name="contact_type_id" value="#attributes.contact_type_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
