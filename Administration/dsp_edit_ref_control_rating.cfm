<!-- Administration/dsp_edit_ref_control_rating.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_control_rating.cfm">
	<responsibilities>
		I display the form for control_rating maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/16/2007" role="FuseCoder" comments="Created File">
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
<cfmodule template="qry_get_ref_control_rating.cfm" control_rating_id="0">
<form name="edit_ref_control_rating_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	Retrieve an existing <label for="control_rating_id">control rating</label>:<br />
	<select name="control_rating_id" id="control_rating_id">
	<cfloop query="get_ref_control_rating"><option value="#control_rating_id#" <cfif not comparenocase(get_ref_control_rating.control_rating_id, attributes.control_rating_id)>selected</cfif>>#description#</option></cfloop>
	</select><br />
	<input type="submit" name="method" value="Retrieve and edit control_rating" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="qry_get_ref_control_rating.cfm" control_rating_id="#attributes.control_rating_id#">
	<cfset attributes.description=get_ref_control_rating.description>
	<cfset attributes.control_rating_id=get_ref_control_rating.control_rating_id>
	<cfset attributes.sort_order=get_ref_control_rating.sort_order>
<cfelse>
	<cfset attributes.sort_order=get_ref_organization.recordcount+1>
</cfif>
<cfform name="REF_control_rating_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999" title="table head describes the data held in the table within this table">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Table displays user account information">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.control_rating_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> Control Rating</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="table displays user account information">
			<tr>
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" size="30" value="#attributes.description#" required="yes" tabindex="1" message="Please enter description." maxlength="30">
				</td>
				<td><label for="sort_order">sort order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value="#attributes.sort_order#" size="3" maxlength="3" required="yes"
						tabindex="2" validate="integer" message="Please enter sort order.">
				</td>
				<cfif attributes.control_rating_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
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
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="control_rating_id" value="#attributes.control_rating_id#" />
			<input type="submit" name="submit" value=" Submit " alt="submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
