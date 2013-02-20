<!--- Administration/pag_edit_ref_fsc.cfm
	Author: Jeromy French--->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_fsc.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/7/2009" role="FuseCoder" comments="Created File">
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
<cfmodule template="../common_files/qry_get_ref_fsc.cfm" fsc_id="0">
<cfset attributes.sort_order=get_ref_fsc.recordcount+1>
<cfset attributes.code="">
<cfoutput>
<form name="edit_ref_fsc_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	Retrieve an existing <label for="fsc_id"><abbr title="Federal Supply Classification">FSC</abbr></label>:<br />
	<select name="fsc_id" id="fsc_id">
	<cfloop query="get_ref_fsc"><option value="#fsc_id#"<cfif NOT comparenocase(get_ref_fsc.fsc_id, attributes.fsc_id)> selected="selected"</cfif>>#description#</option></cfloop>
	</select><br />
	<input type="submit" name="method" value="Retrieve and edit <abbr title='Federal Supply Classification'>FSC</abbr>" class="btn btn-primary" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_fsc.cfm" fsc_id="#attributes.fsc_id#">
	<cfset attributes.description=get_ref_fsc.description>
	<cfset attributes.fsc_id=get_ref_fsc.fsc_id>
	<cfset attributes.code=get_ref_fsc.code>
	<cfset attributes.sort_order=get_ref_fsc.sort_order>
</cfif>
<cfform name="REF_fsc_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999" title="table head describes the data held in the table within this table">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Table displays FSC information">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.fsc_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> <abbr title="Federal Supply Classification">FSC</abbr></strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="table displays FSC information">
			<tr>
				<td><label for="description">Description</label>: 
					<br /><cfinput type="text" name="description" id="description" size="30" value="#attributes.description#" required="yes" tabindex="1" message="Please enter description." maxlength="128">
				</td>
				<td><label for="code">Code</label>: 
					<br /><cfinput type="text" name="code" id="code" value="#attributes.code#" size="20" tabindex="2" required="yes" message="Please enter code." maxlength="20">
				</td>
				<td>
					<label for="sort_order">Sort Order</label>: 
					<br />
					<input type="number" name="sort_order" id="sort_order" value="#attributes.sort_order#" step="1" min="1" required="required" class="span5" />
				</td>
				<cfif attributes.fsc_id EQ 0>
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
		<td class="btn-group">
			<input type="hidden" name="created_by" value="#variables.user_identification#" />
			<input type="hidden" name="fsc_id" value="#attributes.fsc_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
