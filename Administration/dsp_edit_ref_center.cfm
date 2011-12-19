<!-- Administration/dsp_edit_ref_center.cfm
	Author: Lyudmila Klimenko -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_center.cfm">
	<responsibilities>
		I display the form for center maintenance.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="9/14/2007" role="FuseCoder" comments="Created File">
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
#variables.display_message#
<cfparam name="attributes.method" default="">
<cfmodule template="../common_files/qry_get_ref_center.cfm" center_id="0">
<form name="edit_ref_center_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="center_id">
	<cfloop query="get_ref_center"><option value="#center_id#" <cfif not comparenocase(get_ref_center.center_id, attributes.center_id)>selected</cfif>>#description#</option></cfloop>
	</select>
	<input name="method" type="submit" alt="Retrieve and edit center" value="Retrieve and edit center"/>
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_center.cfm" center_id="#attributes.center_id#">
	<cfset attributes.description=get_ref_center.description>
	<cfset attributes.center_id=get_ref_center.center_id>
	<cfset attributes.center_code=get_ref_center.center_code>
	<cfset attributes.abbreviation=get_ref_center.abbreviation>
</cfif>

<cfform name="form_ref_center_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.center_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> CENTER</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Tables shows user account information">
			<tr>
				<td>
					<label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" value="#attributes.description#" size="30" required="yes" tabindex="1"
							message="Please enter description." maxlength="4000">
				</td>
				<td>
					<label for="abbreviation">Abbreviation</label>: 
					<br /><cfinput type="text" name="abbreviation" id="abbreviation" value="#attributes.abbreviation#" size="15" maxlength="4000" required="yes" tabindex="2" message="Please enter abbreviation.">
				</td>
				<td>
					<label for="center_code">Center Code</label>: 
					<br /><cfinput type="text" name="center_code" id="center_code" value="#attributes.center_code#" size="15" maxlength="4000" required="yes" tabindex="3" message="Please enter center code.">
				</td>
			</tr>
			<tr>
				<td>
					<label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value= #IIf(attributes.center_id EQ 0, (""), ("get_ref_center.sort_order"))# size="6" maxlength="12" required="yes" tabindex="4" message="Please enter sort order.">
				</td>
				<cfif attributes.center_id EQ 0>
					<input type="hidden" name="active_ind" value="1"/>
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
			<input type="hidden" name="center_id" value="#attributes.center_id#"/>
			<input name="submit" type="submit" alt="submit" value="Submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>

