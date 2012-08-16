<!--- Administration/pag_edit_ref_geographic_area.cfm
	Author: Jeromy French--->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_geographic_area.cfm">
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
<cfmodule template="../common_files/qry_get_ref_geographic_area.cfm" geographic_area_id="0">
<cfset attributes.sort_order=get_ref_geographic_area.recordcount+1>
<cfset attributes.code="">
<cfoutput>
<form name="edit_ref_geographic_area_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="geographic_area_id">
	<cfloop query="get_ref_geographic_area"><option value="#geographic_area_id#"<cfif NOT comparenocase(get_ref_geographic_area.geographic_area_id, attributes.geographic_area_id)> selected="selected"</cfif>>#description#</option></cfloop>
	</select>
	<input type="submit" name="method" alt="Retrieve and edit geographic area" value="Retrieve and edit geographic area" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_geographic_area.cfm" geographic_area_id="#attributes.geographic_area_id#">
	<cfset attributes.description=get_ref_geographic_area.description>
	<cfset attributes.geographic_area_id=get_ref_geographic_area.geographic_area_id>
	<cfset attributes.code=get_ref_geographic_area.code>
	<cfset attributes.sort_order=get_ref_geographic_area.sort_order>
</cfif>
<cfform name="REF_geographic_area_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999" title="table head describes the data held in the table within this table">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Table displays geographic area information">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.geographic_area_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> Geographic Area</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="table displays geographic area information">
			<tr>
				<td><label for="description">Description</label>: 
					<br /><cfinput type="text" name="description" id="description" size="30" value="#attributes.description#" required="yes" message="Please enter description." maxlength="128">
				</td>
                <td><label for="code">Code</label>: 
					<br /><cfinput type="text" name="code" id="code" value="#attributes.code#" size="20" required="yes" message="Please enter code." maxlength="20">
				</td>
				<td><label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value="#attributes.sort_order#" size="10" maxlength="3" required="yes" validate="integer" message="Please enter sort order.">
				</td>
				<cfif attributes.geographic_area_id EQ 0>
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
		<td  class="btn-group">
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="geographic_area_id" value="#attributes.geographic_area_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
