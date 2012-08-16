<!-- Administration/pag_edit_ref_priority.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_priority.cfm">
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
<cfmodule template="../common_files/qry_get_ref_email_category.cfm" email_category_id="0">
<cfoutput>
<form name="edit_ref_email_category_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="email_category_id">
	<cfloop query="get_ref_email_category"><option value="#email_category_id#"<cfif NOT comparenocase(get_ref_email_category.email_category_id, attributes.email_category_id)> selected="selected"</cfif>>#description#</option></cfloop>
	</select>
	<input type="submit" name="method" alt="Retrieve and edit email category" value="Retrieve and edit email category" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_email_category.cfm" email_category_id="#attributes.email_category_id#">
	<cfset attributes.description=get_ref_email_category.description>
	<cfset attributes.email_category_id=get_ref_email_category.email_category_id>
</cfif>
<cfform name="REF_email category_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999" title="table head describes the data held in the table within this table">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Table displays user account information">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.email_category_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> email category</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="table displays user account information">
			<tr>
				<td>
					<label for="description">Description</label>:
					<br /><cfinput type="text" name="description" id="description" size="30" value="#attributes.description#" required="yes" message="Please enter description." maxlength="2000">
				</td>
				<td>
					<label for="notes">Notes</label>: 
					<br /><cfinput type="text" name="notes" id="notes" size="30" value="#IIf(attributes.email_category_id EQ 0, (""), ("get_ref_email_category.notes"))#" required="yes" message="Please enter notes." maxlength="400">
				</td>
				<td>
					<label for="sort_order">Sort Order</label>:<br />
					<cfinput type="text" name="sort_order" id="sort_order" value="#IIf(attributes.email_category_id EQ 0, ("get_ref_email_category.recordcount+1"), ("get_ref_email_category.sort_order"))#" size="10" maxlength="3" required="yes" validate="integer" message="Please enter sort order.">
				</td>
				<cfif attributes.email_category_id EQ 0>
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
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="email_category_id" value="#attributes.email_category_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
