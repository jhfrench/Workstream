<!-- Administration/dsp_edit_ref_product_version.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_product_version.cfm">
	<responsibilities>
		I display the form for product version maintenance.
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
<cfmodule template="qry_get_ref_product_version.cfm" product_version_id="0">
<form name="edit_ref_product_version_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="product_version_id">
	<cfloop query="get_ref_product_version"><option value="#product_version_id#" <cfif not comparenocase(get_ref_product_version.product_version_id, attributes.product_version_id)>selected</cfif>>#description#</option></cfloop>
	</select>
	<input type="submit" name="method" alt="Retrieve and edit product version" value="Retrieve and edit product version"/>
</form>
<cfif len(attributes.method)>
	<cfmodule template="qry_get_ref_product_version.cfm" product_version_id="#attributes.product_version_id#">
	<cfset attributes.description=get_ref_product_version.description>
	<cfset attributes.product_version_id=get_ref_product_version.product_version_id>
	<cfset attributes.scheduled_release_date=dateformat(get_ref_product_version.scheduled_release_date,"mm/dd/yyyy")>
	<cfset attributes.sort_order=get_ref_product_version.sort_order>
</cfif>
<cfform name="form_ref_product_version_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.product_version_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> PRODUCT VERSION</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays new user information">
			<tr>
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" size="50" value="#attributes.description#" required="yes" message="Please enter description" maxlength="50">
				</td>
				<td><label for="scheduled_release_date">Scheduled Release Date (mm/dd/yyyy)</label>: 
					<br /><cfinput type="text" name="scheduled_release_date" id="scheduled_release_date" size="38" value="#attributes.scheduled_release_date#" required="yes" message="Please enter scheduled release date" maxlength="38">
				</td>
				<td><label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value=#IIf(attributes.product_version_id EQ 0, ("get_ref_product_version_count.count1+1"), ("get_ref_product_version.sort_order"))#
                     size="9" maxlength="12" required="yes" validate="integer" message="Please enter sort order">
				</td>
			<tr>
				<td><span title="describes the purpose of the radio buttons that follow">Selectable indicatior?</span>
					<br /><cfinput type="radio" name="selectable_ind" id="selectable_ind_yes" value="1" checked="yes"><label for="selectable_ind_yes">Yes </label>
				 		<cfinput type="radio" name="selectable_ind" id="selectable_ind_no" value="0" ><label for="selectable_ind_no">No </label>
				</td>
				<cfif attributes.product_version_id EQ 0>
					<input type="hidden" name="active_ind" value="1"/>
				<cfelse>
				<td><span title="describes the purpose of the radio buttons that follow">Active?</span>
					<br /><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes </label>
				 		<cfinput type="radio" name="active_ind" id="active_ind_no" value="0"><label for="active_ind_no">No </label>
				</td>
				</cfif>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="created_by" value="#session.user_account_id#"/>
			<input type="hidden" name="product_version_id" value="#attributes.product_version_id#"/>
			<input type="submit" alt="submit"name="submit" value="Submit" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>


