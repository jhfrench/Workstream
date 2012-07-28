<!-- Administration/dsp_edit_ref_hierarchy_level.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_hierarchy_level.cfm">
	<responsibilities>
		I display the form for hierarchy level maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/17/2007" role="FuseCoder" comments="Created File">
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
<cfmodule template="../common_files/qry_get_ref_hierarchy_level.cfm" hierarchy_level_id="0">
<form name="edit_ref_heirarchy_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="hierarchy_level_id">
	<cfloop query="get_ref_hierarchy_level"><option value="#hierarchy_level_id#" <cfif not comparenocase(get_ref_hierarchy_level.hierarchy_level_id, attributes.hierarchy_level_id)>selected</cfif>>#description#</option></cfloop>
	</select>
	<input type="submit" name="method" alt="Retrieve and edit heirarchy level" value="Retrieve and edit heirarchy level"/>
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_hierarchy_level.cfm" hierarchy_level_id="#attributes.hierarchy_level_id#">
	<cfset attributes.description=get_ref_hierarchy_level.description>
	<cfset attributes.hierarchy_level_id=get_ref_hierarchy_level.hierarchy_level_id>
</cfif>
<cfform name="form_edit_ref_hierarchy_level" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.hierarchy_level_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> HIERARCHY LEVEL</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays user account information">
			<tr>
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" value="#attributes.description#" required="yes" message="Please enter description." maxlength="400">
				</td>
				<td><label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value=" #IIf(attributes.hierarchy_level_id EQ 0, ("get_ref_hierarchy_level.recordcount+1"), ("get_ref_hierarchy_level.sort_order"))#" size="6" maxlength="6" required="yes" validate="integer" message="Please enter sort order.">
				</td>
				<td><label for="form_element_type_id">Form Element Type</label>: 
					<br /><cfselect name="form_element_type_id" id="form_element_type_id" query="get_ref_form_element_type" value="form_element_type_id"
							display="form_element_type_description" selected="#attributes.form_element_type_id#" required="yes" message="Please specify form element type.">
						</cfselect>
				</td>

			</tr>
			<tr>
				<cfif attributes.hierarchy_level_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
				<cfelse>
				<td><span title="describes the purpose of the radio buttons that follow">Active?</span>
					<br /><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes </label>
					 	<cfinput type="radio" name="active_ind" id="active_ind_no" value="0" ><label for="active_ind_no">No </label>
				</td>
				</cfif>
				<td colspan="2"><span title="describes the purpose of the radio buttons that follow">Center Indicator?</span>
					<br /><cfinput type="radio" name="center_ind" id="center_ind_yes" value="1" checked="yes"><label for="center_ind_yes">Yes </label>
				 		<cfinput type="radio" name="center_ind" id="center_ind_no" value="0" ><label for="center_ind_no">No </label>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="attributes.hierarchy_level_id" value="#attributes.hierarchy_level_id#" />
			<input type="submit" alt="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
	</tr>
</table>
</div>
</cfform>
</cfoutput>
