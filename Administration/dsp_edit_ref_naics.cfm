<!-- Administration/pag_edit_ref_naics.cfm
	Author: Ping Liang-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_naics.cfm">
	<responsibilities>
		I display the form for editing naics and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="PLiang@nasa.gov" author="Ping Liang" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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
<cfmodule template="../common_files/qry_get_ref_naics.cfm" naics_id="0">
<cfoutput>
<form name="edit_ref_naics_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	Retrieve an existing <label for="naics_id"><abbr title="North American Industry Classification System">NAICS</abbr> code</label>:<br />
	<select name="naics_id" id="naics_id">
	<cfloop query="get_ref_naics"><option value="#naics_id#"<cfif not comparenocase(get_ref_naics.naics_id, attributes.naics_id)> selected="selected"</cfif>>#code# #description#</option></cfloop>
	</select><br />
	<input type="submit" name="method" value="Retrieve and edit NAICS" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_naics.cfm" naics_id="#attributes.naics_id#">
	<cfset attributes.description=get_ref_naics.description>
    <cfset attributes.code=get_ref_naics.code>     
	<cfset attributes.naics_id=get_ref_naics.naics_id>
</cfif>
<cfform name="REF_naics_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999" title="table head describes the data held in the table within this table">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Table displays user account information">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.naics_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> <abbr title="North American Industry Classification Service">NAICS</abbr></strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="table displays user account information">
			<tr>            	
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" size="50" value="#attributes.description#" required="yes" tabindex="1" message="Please enter description." maxlength="128">
				</td>
				<td><label for="sort_order">sort order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value="#get_ref_naics.recordcount+1#" size="3" maxlength="3" required="yes" tabindex="2" validate="integer" message="Please enter sort order.">
				</td>
				<cfif attributes.naics_id EQ 0>
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
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="naics_id" value="#attributes.naics_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
