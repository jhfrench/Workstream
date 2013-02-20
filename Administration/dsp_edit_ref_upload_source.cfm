<!-- Administration/dsp_edit_ref_upload_source.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_upload_source.cfm">
	<responsibilities>
		I display the form for upload source maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/17/2007" role="FuseCoder" comments="Created File">
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
<cfmodule template="../common_files/qry_get_ref_upload_source.cfm" upload_source_id="0">
<form name="ref_upload_source_edit_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="upload_source_id">
	<cfloop query="get_ref_upload_source"><option value="#upload_source_id#"<cfif NOT comparenocase(get_ref_upload_source.upload_source_id, attributes.upload_source_id)> selected="selected"</cfif>>#upload_source#</option></cfloop>
	</select>
	<input type="submit" name="method" value="Retrieve and edit upload source" class="btn btn-primary" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_upload_source.cfm" upload_source_id="#attributes.upload_source_id#">
	<cfset attributes.description=get_ref_upload_source.upload_source>
	<cfset attributes.upload_source_id=get_ref_upload_source.upload_source_id>
	<cfset attributes.abbreviation=get_ref_upload_source.abbreviation>
	<cfset attributes.upload_template=get_ref_upload_source.upload_template>
	<cfset attributes.worksheet_name=get_ref_upload_source.worksheet_name>
	<cfset attributes.no_dates_present=get_ref_upload_source.no_dates_present>
	<cfset attributes.sort_order=get_ref_upload_source.sort_order>
</cfif>

<cfform name="REF_upload_source_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head for this table describes the table below that houses the form">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.upload_source_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> UPLOAD SOURCE</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays new user information">
			<tr>
				<td><label for="description">Upload Source description</label>: 
					<br /><cfinput type="text" name="description" id="description" value="#attributes.description#" size="40" required="yes" message="Please enter upload source description." maxlength="4000">
				</td>
				<td><label for="abbreviation">Upload Source Abbreviation</label>: 
					<br /><cfinput type="text" name="abbreviation" id="abbreviation" value="#attributes.abbreviation#" size="25" required="yes" message="Please enter upload source abbreviation." maxlength="4000">
				</td>
				<td><label for="upload_template">Upload Template</label>: 
					<br /><cfinput type="text" name="upload_template" id="upload_template" value="#attributes.upload_template#" size="40" required="yes" message="Please enter upload template." maxlength="4000">
				</td>
			</tr>
			<tr>
				<td><label for="worksheet_name">Worksheet Name</label>: 
					<br /><cfinput type="text" name="worksheet_name" id="worksheet_name" value="#attributes.worksheet_name#" size="40" maxlength="80"
							required="yes" message="Please enter worksheet name.">
				</td>
				<td>
					<label for="sort_order">Sort Order</label>: 
					<br />
					<input type="number" name="sort_order" id="sort_order" value="#IIf(attributes.upload_source_id EQ 0, ('get_ref_upload_source.recordcount+1'), ('get_ref_upload_source.sort_order'))#" step="1" min="1" required="required" class="span5" />
				</td>
				<cfif attributes.upload_source_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
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
		<td class="btn-group">
			<input type="hidden" name="created_by" value="#variables.user_identification#" />
			<input type="hidden" name="upload_source_id" value="#attributes.upload_source_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>

