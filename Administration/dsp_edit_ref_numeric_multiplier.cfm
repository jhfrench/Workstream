<!-- Administration/dsp_edit_ref_numeric_multiplier.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_numeric_multiplier.cfm">
	<responsibilities>
		I display the form for numeric multiplier maintenance.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="9/16/2007" role="FuseCoder" comments="Created File">
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
<cfmodule template="../common_files/qry_get_numeric_multiplier.cfm" numeric_multiplier_id="0">
<form name="ref_numeric_multiplier_edit_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="numeric_multiplier_id">
	<cfloop query="get_numeric_multiplier"><option value="#numeric_multiplier_id#" <cfif not comparenocase(get_numeric_multiplier.numeric_multiplier_id, attributes.numeric_multiplier_id)>selected</cfif>>#description#</option></cfloop>
	</select>
	<input name="method" type="submit" alt="Retrieve and edit numeric multiplier" value="Retrieve and edit numeric multiplier"/>
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_numeric_multiplier.cfm" numeric_multiplier_id="#attributes.numeric_multiplier_id#">
	<cfset attributes.description=get_numeric_multiplier.description>
	<cfset attributes.numeric_format_mask=get_numeric_multiplier.numeric_format_mask>
	<cfset attributes.numeric_multiplier_id=get_numeric_multiplier.numeric_multiplier_id>
	<cfset attributes.divisor_to_1=get_numeric_multiplier.divisor_to_1>
</cfif>

<cfform name="REF_numeric_multiplier_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.numeric_multiplier_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> NUMERIC MULTIPLIER</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays user account information">
			<tr>
				<td colspan="2"><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" value="#attributes.description#" size="30" maxlength="100" required="yes" tabindex="1" message="Please enter description." >
				</td>
				<td><label for="divisor_to_1">Divisor to 1</label>: 
					<br /><cfinput type="text" name="divisor_to_1" id="divisor_to_1" value="#attributes.divisor_to_1#" size="12" maxlength="12" required="yes" tabindex="2" validate="integer" message="Please enter divisor to 1.">
				</td>
			</tr>
			<tr>
				<td><label for="numeric_format_mask">Format mask</label>: 
					<br /><cfinput type="text" name="numeric_format_mask" id="numeric_format_mask" value="#attributes.numeric_format_mask#" size="30" maxlength="30" required="yes" tabindex="3" message="Please enter a format mask.">
				</td>
				<td><label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value="#get_numeric_multiplier.recordcount+1#" size="6" maxlength="6" required="yes" tabindex="4" validate="integer" message="Please enter sort order.">
				</td>
				<cfif attributes.numeric_multiplier_id EQ 0>
					<input type="hidden" name="active_ind" value="1"/>
				<cfelse>
				<td>
				<cfif get_numeric_multiplier.active_ind>
					<cfset variables.active_checked="yes">
					<cfset variables.inactive_checked="no">
				<cfelse>
					<cfset variables.active_checked="no">
					<cfset variables.inactive_checked="yes">
				</cfif>
					<span title="describes the purpose of the radio buttons that follow">Active?</span>
					<br /><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="#variables.active_checked#"><label for="active_ind_yes">Yes </label>
				 		<cfinput type="radio" name="active_ind" id="active_ind_no" value="0" checked="#variables.inactive_checked#"><label for="active_ind_no">No </label>
				</td>
				</cfif>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="numeric_multiplier_id" value="#attributes.numeric_multiplier_id#" />
			<input type="submit" alt="submit" value=" Submit " />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>