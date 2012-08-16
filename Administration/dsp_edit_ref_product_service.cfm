<!-- Administration/dsp_edit_ref_product_service.cfm
	Author: Ping Liang-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_product_service.cfm">
	<responsibilities>
		I display the form for ccr status maintenance.
	</responsibilities>
	<properties>
		<history email="Pliang@hq.nasa.gov" author="Ping Liang" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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
<cfmodule template="../common_files/qry_get_ref_product_service.cfm.cfm" product_service_id="0">

<cfoutput>
<form name="ref_product_service_edit_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="product_service_id">
		<cfloop query="get_ref_product_service">
		<option value="#product_service_id#"<cfif NOT comparenocase(get_ref_product_service.product_service_id, attributes.product_service_id)> selected="selected"</cfif>>#description#</option>
		</cfloop>
	</select>
	<input type="submit" name="method" alt="Retrieve and Edit Product Service" value="Retrieve and Edit Product Service" />
</form>

<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_product_service.cfm.cfm" product_service_id="#attributes.product_service_id#">
	<cfset attributes.product_service_id  =get_ref_product_service.product_service_id>
    <cfset attributes.code           =get_ref_product_service.code>     
	<cfset attributes.description    =get_ref_product_service.description>
	<cfset attributes.sort_order     =get_ref_product_service.sort_order>
	<cfset attributes.active_ind     =get_ref_product_service.active_ind>
</cfif>

<cfform name="REF_product_service_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.product_service_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> Product Service</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="table displays product service information">
			<tr>
				<td><label for="code">Code</label>: </td>
				<td><cfinput type="text" name="code" id="code" size="6"  maxlength="6" value="#attributes.code#" required="yes" message="Please enter type code."></td>
			</tr>
			<tr>
				<td><label for="description">Description</label>: </td>
				<td><cfinput type="text" name="description" id="description" size="40" value="#attributes.description#" required="yes" message="Please enter description." maxlength="400"></td>
			</tr>
			<tr>
				<td><label for="sort_order">Sort Order</label>: </td>
				<td><cfinput type="text" name="sort_order" id="sort_order" value="#attributes.sort_order#" size="3" maxlength="3" required="yes" validate="integer" message="Please enter sort order."></td>
			</tr>
			<tr>
				<cfif attributes.active_ind EQ 1>
					<cfset check_active_ind_1="yes">
					<cfset check_active_ind_0="no">
				<cfelse>
					<cfset check_active_ind_1="no">
					<cfset check_active_ind_0="yes">
				</cfif>
				<td><span title="describes the purpose of the radio buttons that follow">Active?</span></td>
				<td><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="#check_active_ind_1#"><label for="active_ind_yes">Yes </label>
				 	<cfinput type="radio" name="active_ind" id="active_ind_no"  value="0" checked="#check_active_ind_0#"><label for="active_ind_no">No </label>
				</td>

			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td  class="btn-group">
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="product_service_id" value="#attributes.product_service_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>

