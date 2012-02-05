<!-- Requirements/dsp_edit_requirements.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_requirements.cfm">
	<responsibilities>
		I display the form for adding or editing user requirements.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.requirement_id" default="0">

<cfif get_requirement.recordcount NEQ 0>
	<cfset variables.priority_id=get_requirement.priority_id>
	<cfset variables.product_version_id=get_requirement.product_version_id>
	<cfset variables.screen_id=get_requirement.screen_id>
<cfelse>
	<cfinclude template="qry_get_screen_id_from_referrer.cfm">
	<cfset variables.screen_id=get_screen_id_from_referrer.screen_id>
	<cfset variables.product_version_id=0>
	<!--- default priority to normal --->
	<cfset variables.priority_id=3>
</cfif>

<cfoutput>
<cfform name="requirment_entry" action="index.cfm?fuseaction=Requirements.edit_requirement" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table displays requiremnts information">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.requirement_id EQ 0>ADD NEW REQUIREMENT<cfelse>EDIT EXISTING REQUIREMENT</cfif></strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="table uses fuseaction">
			<tr>
				<td colspan="2">
					<label for="screen_id">Fuseaction</label>:
					<br /><cfselect name="screen_id" id="screen_id" query="get_fuseactions" value="screen_id" display="fuseaction" selected="#variables.screen_id#" required="yes" message="Please specify the fuseaction for this requirement." />
				</td>
				<td>
					<label for="product_version_id">Requested Product Version</label>:
					<br /><cfselect name="product_version_id" id="requirement_type_id" required="yes" message="Please specify the type of requirement you are entering.">
							<cfloop query="get_ref_product_version">
							<option value="#get_ref_product_version.product_version_id#"<cfif variables.product_version_id EQ get_ref_product_version.product_version_id> SELECTED</cfif>>#description# (anticipated release:<cfif len(scheduled_release_date)>#dateformat(scheduled_release_date, "mm/dd/yyyy")#<cfelse>unknown</cfif>)</option>
							</cfloop>
						</cfselect>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label for="requirement_type_id">Requirement Type</label>:
					<br /><cfselect name="requirement_type_id" id="requirement_type_id" query="get_requirement_type" value="requirement_type_id" display="description" selected="#get_requirement.requirement_type_id#" required="yes" message="Please specify the type of requirement you are entering." />
				</td>
				<td>
					<label for="requirement_number">Requirement Number</label>:
					<br /><cfinput type="text" name="requirement_number" id="requirement_number" value="#get_requirement.requirement_number#" size="3" maxlength="200" required="yes" validate="integer" message="Please enter a requirement number.">
				</td>
			</tr>
			<tr>
				<td>
					<label for="screen_id">Priority</label>:
					<br /><cfselect name="priority_id" id="priority_id" query="get_priority" value="priority_id" display="description" selected="#variables.priority_id#" required="yes" message="Please specify the priority for this requirement." />
				</td>
				<td>
					<label for="sort_order">Sort Order</label>:
					<br /><cfinput type="text" name="sort_order" id="sort_order" value="#get_requirement.sort_order#" size="3" maxlength="3" required="yes" validate="integer" message="Please enter a sort order.">
				</td>
				<cfif attributes.requirement_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
				<cfelse>
				<td>Active?
					<br /><label for="active_ind_yes"><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes">Yes</label>
					<label for="active_ind_no"><cfinput type="radio" name="active_ind" id="active_ind_no" value="0">No</label>
				</td>
	  			</cfif>
			</tr>
			<tr>
				<td colspan="3">
					<label for="requirement_description">Requirement description</label>:
					<br />
					<cfif get_requirement.active_ind EQ 0>
						#trim(get_requirement.requirement_description)#
					<cfelse>
						<textarea name="requirement_description" id="requirement_description" cols="50" rows="10">#trim(get_requirement.requirement_description)#</textarea>
					</cfif>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="requirement_id" value="#attributes.requirement_id#" />
			<cfif get_requirement.active_ind EQ 0>
				You cannot edit an inactive requirement
			<cfelse>
			<input type="submit" alt="Update Requirement" name="send_req" value="Update Requirement" />
			</cfif>
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>

