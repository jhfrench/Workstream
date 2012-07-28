<!-- Administration/dsp_edit_ref_module.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_module.cfm">
	<responsibilities>
		I display the form for module maintenance.
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
<cfmodule template="../common_files/qry_get_ref_module.cfm" module_id="0">
<form name="edit_ref_module_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="module_id">
	<cfloop query="get_ref_module"><option value="#module_id#" <cfif not comparenocase(get_ref_module.module_id, attributes.module_id)>selected</cfif>>#description#</option></cfloop>
	</select>
	<input type="submit" name="method" alt="Retrieve and edit module" value="Retrieve and edit module" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_module.cfm" module_id="#attributes.module_id#">
	<cfset attributes.description=get_ref_module.description>
	<cfset attributes.module_id=get_ref_module.module_id>
</cfif>

<cfform name="ref_module_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.module_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> MODULE</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays user account information">
			<tr>
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" value="#attributes.description#" required="yes" message="Please enter description." maxlength="100">
				</td>
				<td><label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value=
                     #IIf(attributes.module_id EQ 0, ("get_ref_module.recordcount+1"), ("get_ref_module.sort_order"))# size="6" maxlength="6" required="yes" validate="integer" message="Please enter sort order.">
				</td>
				<td><span title="describes the purpose of the radio buttons that follow">Viewable Indicator?</span>
					<br /><cfinput type="radio" name="viewable_ind" id="viewable_ind_yes" value="1" checked="yes"><label for="viewable_ind_yes">Yes </label>
				 		<cfinput type="radio" name="viewable_ind" id="viewable_ind_no" value="0" ><label for="viewable_ind_no">No </label>
				</td>
			</tr>
			<tr>
				<td><span title="describes the purpose of the radio buttons that follow">Assign hierarchy Privileges Ind?</span>
					<br /><cfinput type="radio" name="assign_hier_privileges_ind" id="assign_hier_privileges_ind_yes" value="1" checked="yes"><label for="assign_hier_privileges_ind_yes">Yes </label>
				 		<cfinput type="radio" name="assign_hier_privileges_ind" id="assign_hier_privileges_ind_no" value="0" ><label for="assign_hier_privileges_ind_no">No </label>
				</td>
				<td><span title="describes the purpose of the radio buttons that follow">Required Indicator?</span>
					<br /><cfinput type="radio" name="required_ind" id="required_ind_yes" value="1" checked="yes"><label for="required_ind_yes">Yes </label>
				 		<cfinput type="radio" name="required_ind" id="required_ind_no" value="0" ><label for="required_ind_no">No </label>
				</td>
				<cfif attributes.module_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
				<cfelse>
				<td><span title="describes the purpose of the radio buttons that follow">Active?</span>
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
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="attributes.module_id" value="#attributes.module_id#"/>
			<input type="submit" alt="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>

