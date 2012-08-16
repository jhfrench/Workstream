<!-- Administration/dsp_edit_ref_program_year.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_program_year.cfm">
	<responsibilities>
		I display the form for program year maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/16/2007" role="FuseCoder" comments="Created File">
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
<cfmodule template="../common_files/qry_get_program_year.cfm" exclude_future_years_ind="0" program_year_id="0">
<form name="edit_ref_program_year_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="program_year_id">
	<cfloop query="get_program_year"><option value="#program_year_id#"<cfif NOT comparenocase(get_program_year.program_year_id, attributes.program_year_id)> selected="selected"</cfif>>#description#</option></cfloop>
	</select>
	<input type="submit" name="method" alt="Retrieve and edit program year" value="Retrieve and edit program year" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_program_year.cfm" program_year_id="#attributes.program_year_id#">
	<cfset attributes.description=get_program_year.description>
	<cfset attributes.sort_order=get_program_year.sort_order>
	<cfset attributes.privilege_id=get_program_year.program_year_id>
</cfif>

<cfform name="REF_program_year_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the table held within that houses the form">
	<tr bgcolor="##cccccc"><th><strong>ADD NEW PROGRAM YEAR</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table used to add new program year">
			<tr>
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" value="#attributes.description#" size="30" required="yes" message="Please enter description." maxlength="4000">
				</td>
				<td><label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value="#attributes.sort_order#" size="6" maxlength="12" required="yes" validate="integer" message="Please enter sort order.">
				</td>
				<cfif attributes.program_year_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
				<cfelse>
				<td>
					<span title="describes the purpose of the radio buttons that follow">Active?</span>
					<br />
					<cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes</label>
				 	<cfinput type="radio" name="active_ind" id="active_ind_no" value="0" ><label for="active_ind_no">No</label>
				</td>
				</cfif>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td class="btn-group">
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="program_year_id" value="#attributes.program_year_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>

