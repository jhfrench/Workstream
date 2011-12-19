<!-- Administration/dsp_edit_ref_organization.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_organization.cfm">
	<responsibilities>
		I display the form for organization maintenance.
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
<cfmodule template="../common_files/qry_get_ref_organization.cfm" organization_id="0">
<form name="edit_ref_organization_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	Retrieve an existing <label for="organization_id">organization</label>:<br />
	<select name="organization_id" id="organization_id">
	<cfloop query="get_ref_organization"><option value="#organization_id#" <cfif not comparenocase(get_ref_organization.organization_id, attributes.organization_id)>selected</cfif>>#description#</option></cfloop>
	</select><br />
	<input type="submit" name="method" value="Retrieve and edit organization" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_organization.cfm" organization_id="#attributes.organization_id#">
	<cfset attributes.abbreviation=get_ref_organization.abbreviation>
	<cfset attributes.description=get_ref_organization.description>
	<cfset attributes.organization_id=get_ref_organization.organization_id>
	<cfset attributes.sort_order=get_ref_organization.sort_order>
<cfelse>
	<cfset attributes.sort_order=get_ref_organization.recordcount+1>
</cfif>
<cfform name="REF_organization_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999" title="table head describes the data held in the table within this table">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Table displays user account information">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.organization_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> ORGANIZATION</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="table displays user account information">
			<tr>
				<td><label for="description">Description</label>:<cfinput type="text" name="description" id="description" size="30" value="#attributes.description#" required="yes" tabindex="1" message="Please enter description." maxlength="4000">
				</td>
			</tr>
			<tr>
				<td><label for="organization_code">Organization Code</label>:<cfinput type="text" name="organization_code" id="organization_code" size="30" value="#attributes.abbreviation#" required="no" tabindex="2" maxlength="30">
				</td>
			</tr>
			<tr>
				<td><label for="description">Abbreviation</label>:<cfinput type="text" name="abbreviation" id="abbreviation" size="30" value="#attributes.abbreviation#" required="no" tabindex="3" maxlength="30">
				</td>
			</tr>
			<tr>
				<td><label for="sort_order">sort order</label>:<cfinput type="text" name="sort_order" id="sort_order" value="#attributes.sort_order#" size="3" maxlength="3" required="yes" tabindex="4" validate="integer" message="Please enter sort order.">
				</td>
			</tr>
			<tr>
				<cfif attributes.organization_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
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
		<td align="center">
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="organization_id" value="#attributes.organization_id#" />
			<input type="submit" name="submit" value=" Submit " alt="submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
