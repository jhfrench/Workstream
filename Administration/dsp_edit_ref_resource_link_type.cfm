<!-- Administration/dsp_edit_ref_resource_link_type.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_resource_link_type.cfm">
	<responsibilities>
		I display the form for resource link type maintenance.
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
<cfmodule template="../common_files/qry_get_ref_resource_link_type.cfm" resource_link_type_id="0">
<form name="ref_resource_link_type_edit_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="resource_link_type_id">
	<cfloop query="get_ref_resource_link_type"><option value="#resource_link_type_id#" <cfif not comparenocase(get_ref_resource_link_type.resource_link_type_id, attributes.resource_link_type_id)>selected</cfif>>#description#</option></cfloop>
	</select>
	<input name="method" type="submit" alt="Retrieve and edit resource link type" value="Retrieve and edit resource link type"/>
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_resource_link_type.cfm"  resource_link_type_id="#attributes.resource_link_type_id#">
	<cfset attributes.description=get_ref_resource_link_type.description>
	<cfset attributes.resource_link_type_id=get_ref_resource_link_type.resource_link_type_id>
</cfif>
<cfform name="form_ref_resource_link_type_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="the table head describes the table within that houses the form">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.resource_link_type_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> RESOURCE LINK TYPE</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0"  summary="Table displays new user information">
			<tr>
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" value="#attributes.description#" size="30" required="yes" message="Please enter description." maxlength="2000">
				</td>
				<td><label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value="#get_ref_resource_link_type_count.count1+1#" size="6" maxlength="12" required="yes" validate="integer" message="Please enter sort order.">
				</td>
				<cfif attributes.resource_link_type_id EQ 0>
					<input type="hidden" name="active_ind" value="1"/>
				<cfelse>
				<td>
					<span title="describes the purpose of the radio buttons that follow">Active?</span>
					<br />
					<cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes </label>
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
			<input type="hidden" name="resource_link_type_id" value="#attributes.resource_link_type_id#" />
			<input type="submit" alt="submit"value=" Submit "/>
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
