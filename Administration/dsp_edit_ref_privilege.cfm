<!-- Administration/dsp_edit_ref_privilege.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_privilege.cfm">
	<responsibilities>
		I display the form for user privilege maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/16/2007" role="FuseCoder" comments="Created File">
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

<cfoutput>
<cfparam name="attributes.method" default="">
<cfmodule template="../common_files/qry_get_ref_privilege.cfm" privilege_id="0">
<form name="edit_ref_privilege_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="privilege_id">
	<cfloop query="get_ref_privilege"><option value="#privilege_id#"<cfif NOT comparenocase(get_ref_privilege.privilege_id, attributes.privilege_id)> selected="selected"</cfif>>#description#</option></cfloop>
	</select>
	<input type="submit" name="method" value="Retrieve and edit privilege" class="btn btn-primary" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_privilege.cfm" privilege_id="#attributes.privilege_id#">
	<cfset attributes.description=get_ref_privilege.description>
	<cfset attributes.privilege_id=get_ref_privilege.privilege_id>
</cfif>

<cfform name="REF_privilege_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" id="REF_Privilege entry form" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.privilege_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> PRIVILEGE</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table display user accoutn inforamtion">
			<tr>
				<td><label for="description">description</label>:
					<br /><cfinput type="text" name="description" id="description" size="30" value="#attributes.description#" required="yes" message="Please enter description." maxlength="4000">
				</td>
				<td>
					<label for="sort_order">Sort Order</label>:
					<br />
					<input type="number" name="sort_order" id="sort_order" value="#iif(attributes.privilege_id EQ 0, ('get_ref_privilege.recordcount+1'), ('get_ref_privilege.sort_order'))#" step="1" min="1" required="required" class="span5 number" />
				</td>
				<cfif attributes.privilege_id EQ 0>
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
			<input type="hidden" name="privilege_id" value="#attributes.privilege_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
