<!-- Administration/dsp_edit_ref_upload_source.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_upload_source.cfm">
	<responsibilities>
		I display the form for upload source maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/17/2007" role="FuseCoder" comments="Created File">
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
<!---$issue$: this needs an insert/update into the database for submitted values--->
<cfoutput>
<cfparam name="attributes.method" default="">
<cfmodule template="../common_files/qry_get_ref_upload_source.cfm"  upload_source_id="0">
<form name="ref_upload_source_edit_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	Retrieve an existing <label for="upload_source_id">upload source</label>:<br />
	<select name="upload_source_id" id="upload_source_id">
	<cfloop query="get_ref_upload_source"><option value="#upload_source_id#" <cfif not comparenocase(get_ref_upload_source.upload_source_id, attributes.upload_source_id)>selected</cfif>>#upload_source#</option></cfloop>
	</select><br />
	<input type="submit" name="method" alt="Retrieve and edit upload source" value="Retrieve and edit upload source" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_upload_source.cfm"  upload_source_id="#attributes.upload_source_id#">
	<cfscript>
		attributes.abbreviation=get_ref_upload_source.abbreviation;
		attributes.description=get_ref_upload_source.upload_source;
		attributes.no_dates_present=get_ref_upload_source.no_dates_present;
		attributes.sort_order=get_ref_upload_source.sort_order;
		attributes.upload_source_id=get_ref_upload_source.upload_source_id;
		attributes.upload_template=get_ref_upload_source.upload_template;
		attributes.worksheet_name=get_ref_upload_source.worksheet_name;
	</cfscript>
</cfif>

<cfform name="REF_upload_source_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head for this table describes the table below that houses the form">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.upload_source_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> UPLOAD SOURCE</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0"  summary="Table displays new user information">
			<tr>
				<td><label for="description">Upload Source description</label>: 
					<br /><cfinput type="text" name="description" id="description" value="#attributes.description#" size="40" required="yes" tabindex="1" message="Please enter upload source description." maxlength="4000">
				</td>
				<td><label for="abbreviation">Upload Source Abbreviation</label>: 
					<br /><cfinput type="text" name="abbreviation" id="abbreviation" value="#attributes.abbreviation#" size="25" required="yes" tabindex="2" message="Please enter upload source abbreviation." maxlength="4000">
				</td>
				<td><label for="upload_template">Upload Template</label>: 
					<br /><cfinput type="text" name="upload_template" id="upload_template" value="#attributes.upload_template#" size="40" required="yes" tabindex="3" message="Please enter upload template." maxlength="4000" />
				</td>
			</tr>
			<tr>
				<td><label for="worksheet_name">Worksheet Name</label>: 
					<br /><cfinput type="text" name="worksheet_name" id="worksheet_name" value="#attributes.worksheet_name#" size="40" required="yes" tabindex="4" message="Please enter worksheet name." maxlength="80" />
				</td>
				<td><label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value="#attributes.sort_order#" size="6" required="yes" tabindex="5" validate="integer" message="Please enter sort order." maxlength="12" />
				</td>
				<cfif attributes.upload_source_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
				<cfelse>
				<td>
					<span title="describes the purpose of the radio buttons that follow">Active?</span><br />
					<label for="active_ind_yes"><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes">Yes</label>
				 	<label for="active_ind_no"><cfinput type="radio" name="active_ind" id="active_ind_no" value="0" >No</label>
				</td>
				</cfif>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="upload_source_id" value="#attributes.upload_source_id#" />
			<input type="submit" name="submit" value=" Submit " alt="submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>		
	
