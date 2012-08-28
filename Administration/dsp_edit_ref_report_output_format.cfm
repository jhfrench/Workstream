<!-- Administration/dsp_edit_ref_report_output_format.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_report_output_format.cfm">
	<responsibilities>
		I display the form for report output format maintenance.
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
<cfmodule template="../common_files/qry_get_ref_report_output_format.cfm" report_output_format_id="0">
<form name="ref_report_output_format_edit_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="report_output_format_id">
	<cfloop query="get_ref_report_output_format"><option value="#report_output_format_id#"<cfif NOT comparenocase(get_ref_report_output_format.report_output_format_id, attributes.report_output_format_id)> selected="selected"</cfif>>#description#</option></cfloop>
	</select>
	<input type="submit" name="method" alt="Retrieve and edit report output format" value="Retrieve and edit report output format" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_report_output_format.cfm" report_output_format_id="#attributes.report_output_format_id#">
	<cfset attributes.description=get_ref_report_output_format.description>
	<cfset attributes.report_output_format_id=get_ref_report_output_format.report_output_format_id>
</cfif>
<cfform name="form_ref_report_output_format_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head in this table describes the table within that holds the form">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.report_output_format_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> REPORT OUTPUT FORMAT</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays new user information">
			<tr>
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" size="30" maxlength="400" value="#attributes.description#" required="yes" message="Please enter description.">
				</td>
				<td>
					<label for="sort_order">Sort Order</label>: 
					<br />
					<input type="number" name="sort_order" id="sort_order" value="#get_ref_report_output_format.recordcount+1#" step="1" min="1" required="required" class="span5" />
				</td>
				<cfif attributes.report_output_format_id EQ 0>
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
		<td class="btn-group">
			<input type="hidden" name="created_by" value="#variables.user_identification#" />
			<input type="hidden" name="report_output_format_id" value="#attributes.report_output_format_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>


