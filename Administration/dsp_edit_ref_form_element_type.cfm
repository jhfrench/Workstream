<!-- Administration/dsp_edit_ref_form_element_type.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_form_element_type.cfm">
	<responsibilities>
		I display the form for form element type maintenance.
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
<cfparam name="attributes.method" default="">
<cfmodule template="qry_get_ref_form_element_type.cfm" form_element_type_id="0">
<form name="edit_ref_form_element_type_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="form_element_type_id">
	<cfloop query="get_ref_form_element_type"><option value="#form_element_type_id#"<cfif not comparenocase(get_ref_form_element_type.form_element_type_id, attributes.form_element_type_id)> selected="selected"</cfif>>#form_element_type_description#</option></cfloop>
	</select>
	<input type="submit" name="method" alt="Retrieve and edit form element type" value="Retrieve and edit form element type"/>
</form>
<cfif len(attributes.method)>
	<cfmodule template="qry_get_ref_form_element_type.cfm" form_element_type_id="#attributes.form_element_type_id#">
	<cfset attributes.description=get_ref_form_element_type.form_element_type_description>
	<cfset attributes.form_element_type_id=get_ref_form_element_type.form_element_type_id>
</cfif>

<cfform name="form_ref_form_element_type_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.form_element_type_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> FORM ELEMENT TYPE</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays user account information">
			<tr>
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" size="50" value="#attributes.description#" required="yes"
							message="Please enter description." maxlength="200">
				</td>
				<cfif attributes.form_element_type_id EQ 0>
					<input type="hidden" name="active_ind" value="1"/>
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
		<td  class="btn-group">
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="form_element_type_id" value="#attributes.form_element_type_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>


