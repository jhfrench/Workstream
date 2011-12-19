<!-- Administration/dsp_edit_ref_report_output_format.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_report_output_format.cfm">
	<responsibilities>
		I display the form for report output format maintenance.
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

<cfoutput>
<cfparam name="attributes.method" default="">
<cfmodule template="../common_files/qry_get_ref_report_output_format.cfm" report_output_format_id="0">
<form name="ref_report_output_format_edit_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	Retrieve an existing <label for="report_output_format_id">report output format</label>:<br />
	<select name="report_output_format_id" id="report_output_format_id">
		<cfloop query="get_ref_report_output_format"><option value="#report_output_format_id#" <cfif not comparenocase(get_ref_report_output_format.report_output_format_id, attributes.report_output_format_id)>selected</cfif>>#description#</option></cfloop>
	</select><br />
	<input type="submit" name="method" value="Retrieve and edit report output format" />
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
		<table width="100%" cellspacing="0" cellpadding="8" border="0"  summary="Table displays new user information">
			<tr>
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" size="30" maxlength="400" value="#attributes.description#" required="yes" tabindex="1" message="Please enter description.">
				</td>
				<td><label for="sort_order">sort order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value="#get_ref_report_output_format.recordcount+1#" size="3" maxlength="3" required="yes" tabindex="2" validate="integer" message="Please enter sort order.">
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
		<td align="center">
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="report_output_format_id" value="#attributes.report_output_format_id#" />
			<input type="submit" name="submit" value=" Submit " alt="submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>


