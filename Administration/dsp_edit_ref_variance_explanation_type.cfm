<!-- Administration/dsp_edit_ref_variance_explanation_type.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_variance_explanation_type.cfm">
	<responsibilities>
		I display the form for editing variance explanation type and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="9/17/2007" role="FuseCoder" comments="Created File">
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
<cfmodule template="../common_files/qry_get_ref_variance_explanation_type.cfm"  variance_explanation_type_id="0">
<form name="ref_variance_explanation_type_edit_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="variance_explanation_type_id">
	<cfloop query="get_ref_variance_explanation_type"><option value="#variance_explanation_type_id#" <cfif not comparenocase(get_ref_variance_explanation_type.variance_explanation_type_id, attributes.variance_explanation_type_id)>selected</cfif>>#description#</option></cfloop>
	</select>
	<input name="method" type="submit" alt="Retrieve and edit variance explanation type" value="Retrieve and edit variance explanation type"/>
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_variance_explanation_type.cfm"  variance_explanation_type_id="#attributes.variance_explanation_type_id#">
	<cfset attributes.description=get_ref_variance_explanation_type.description>
	<cfset attributes.variance_explanation_type_id=get_ref_variance_explanation_type.variance_explanation_type_id>
</cfif>

<cfform name="REF_variance_explanation_type_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="the table head describes the table within that houses the form">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.variance_explanation_type_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> VARIANCE EXPLANATION TYPE</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0"  summary="Table displays new user information">
			<tr>
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" value="#attributes.description#" size="30" required="yes" tabindex="1" message="Please enter description." maxlength="30">
				</td>
				<td><label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value="#get_ref_variance_explanation_type.recordcount+1#" size="6" maxlength="12" required="yes" tabindex="2" validate="integer" message="Please enter sort order.">
				</td>
				<cfif attributes.variance_explanation_type_id EQ 0>
					<input type="hidden" name="active_ind" value="1"/>
				<cfelse>
				<td><span title="describes the purpose of the radio buttons that follow">Active?</span>
					<br /><label for="active_ind_yes"><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes">Yes </label>
				 		<label for="active_ind_no"><cfinput type="radio" name="active_ind" id="active_ind_no" value="0" >No </label>
				</td>
				</cfif>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="variance_explanation_type_id" value="#attributes.variance_explanation_type_id#" />
			<input type="submit" alt="submit" value="Submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>

