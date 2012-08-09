<!-- Administration/dsp_edit_ref_business_function.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_business_function.cfm">
	<responsibilities>
		I desplay the form for business function maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/14/2007" role="FuseCoder" comments="Created File">
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

<cfmodule template="qry_get_business_function.cfm" business_function_id="0">

<form name="ref_business_function_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<label for="business_function_id">Retrieve an existing business function</label>:<br/>
	<select name="business_function_id">
	<cfloop query="get_business_function"><option value="#business_function_id#"<cfif not comparenocase(get_business_function.business_function_id, attributes.business_function_id)> selected</cfif>>#description#</option></cfloop>
	</select>
	<input type="submit" name="method" alt="Retrieve and edit business function" value="Retrieve and edit business function"/>
</form>
<br/>
<cfform name="REF_business_function_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.business_function_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> BUSINESS FUNCTION</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
			<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Manage REF_Business_Function table">
				<tr>
					<td>
						<label for="description">Description</label>:<br />
						<cfinput type="text" name="description" id="description" value="#attributes.description#" size="30" maxlength="200" required="yes" message="Please enter description.">
					</td>
					<td>
						<label for="acronym">Acronym</label>:<br />
						<cfinput type="text" name="acronym" id="acronym" value="#attributes.acronym#" size="15" maxlength="15" required="yes" message="Please enter acronym.">
					</td>
				</tr>
				<tr>
					<td>
						<label for="parent_business_function_id" title="Not required, used to nest navigation.">Parent business function</label>:<br />
						<select name="parent_business_function_id">
						<option value="NULL">No Parent</option>
						<cfloop query="get_business_function"><option value="#business_function_id#"<cfif not comparenocase(get_business_function.business_function_id, attributes.parent_business_function_id)> selected</cfif>>#description#</option></cfloop>
						</select>
					</td>
					<td>
						<span title="describes the purpose of the radio buttons that follow">Is a login required to access?</span><br />
						<cfinput type="radio" name="require_login_ind" id="require_login_ind_yes" value="1" checked="#variables.require_login_ind_yes#"><label for="require_login_ind_yes">Yes</label>
						<cfinput type="radio" name="require_login_ind" id="require_login_ind_no" value="0" checked="#variables.require_login_ind_no#"><label for="require_login_ind_no">No</label>
					</td>
				</tr>
				<tr>
					<td>
						<span title="describes the purpose of the radio buttons that follow">Default Access Indicator:</span><br />
						<cfinput type="radio" name="default_access_ind" id="default_access_ind_yes" value="1" checked="#variables.default_access_ind_yes#"><label for="default_access_ind_yes">Yes</label>
						<cfinput type="radio" name="default_access_ind" id="default_access_ind_no" value="0" checked="#variables.default_access_ind_no#"><label for="default_access_ind_no">No</label>
					</td>
					<td>
						<span title="describes the purpose of the radio buttons that follow">Viewable Indicator?</span><br />
						<cfinput type="radio" name="viewable_ind" id="viewable_ind_yes" value="1" checked="#variables.viewable_ind_yes#"><label for="viewable_ind_yes">Yes</label>
						<cfinput type="radio" name="viewable_ind" id="viewable_ind_no" value="0" checked="#variables.viewable_ind_no#"><label for="viewable_ind_no">No</label>
					</td>
				</tr>
				<tr>
					<td>
						<label for="sort_order">Sort Order</label>:<br />
						<cfinput type="text" name="sort_order" id="sort_order" value="#attributes.sort_order#" size="6" maxlength="12" required="no" validate="integer" message="Please enter sort order.">
					</td>
					<td>
					<cfif attributes.business_function_id EQ 0>
						<input type="hidden" name="active_ind" value="1"/>
					<cfelse>
						<span title="describes the purpose of the radio buttons that follow">Active?</span><br />
						<cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="#variables.active_ind_yes#"><label for="active_ind_yes">Yes</label>
						<cfinput type="radio" name="active_ind" id="active_ind_no" value="0" checked="#variables.active_ind_no#"><label for="active_ind_no">No</label>
					</cfif>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td  class="btn-group">
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="business_function_id" value="#attributes.business_function_id#"/>
			<input name="submit" type="submit" alt="submit" value="Submit" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>