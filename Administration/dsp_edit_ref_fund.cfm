<!-- Administration/dsp_edit_REF_Fund.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_REF_Fund.cfm">
	<responsibilities>
		I display the form for fund maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/14/2007" role="FuseCoder" comments="Created File">
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
<cfmodule template="../common_files/qry_get_ref_fund.cfm" fund_id="0">
<form name="edit_REF_Fund_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="fund_id">
	<cfloop query="get_ref_fund"><option value="#fund_id#"<cfif NOT comparenocase(get_ref_fund.fund_id, attributes.fund_id)> selected="selected"</cfif>>#description#</option></cfloop>
	</select>
	<input type="submit" name="method" alt="Retrieve and edit fund" value="Retrieve and edit fund" />
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_fund.cfm" fund_id="#attributes.fund_id#" />
	<cfset attributes.description=get_ref_fund.description>
	<cfset attributes.fund_id=get_ref_fund.fund_id>
</cfif>

<table cellpadding="0" cellspacing="0" border="0" summary="Table displays funds to edit">
	<tr>
		<th align="left"><h2 style="margin:0px" id="top-side"><a href="index.cfm?fuseaction=Administration.fund_control_welcome">Fund Control</a> &gt; Add New Fund</h2></th>
	</tr>
</table>
<cfform name="form_REF_Fund_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.fund_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> FUND</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays user account information">
			<tr>
				<td><label for="description">Fund</label>: 
					<br /><cfinput type="text" name="description" id="description" value="#attributes.description#" size="50" required="yes" message="Please enter fund description." maxlength="128">
				</td>
				<td><label for="program_year_id">Program Year</label>: 
					<br /><cfselect name="program_year_id" id="program_year_id" query="get_program_year" multiple="yes" value="program_year_id" display="description" selected="#attributes.program_year_id#" required="yes" message="Please specify the program year(s).">
						</cfselect>
				</td>
			</tr>
			<cfif attributes.fund_id EQ 0>
				<input type="hidden" name="active_ind" value="1" />
			<cfelse>
			<tr>
				<td>&nbsp;</td>
				<td><span title="describes the purpose of the radio buttons that follow">Active?</span>
					<br /><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes </label>
				 		 <cfinput type="radio" name="active_ind" id="active_ind_no" value="0" ><label for="active_ind_no">No </label>
				</td>
			</tr></cfif>

		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td class="btn-group">
			<input type="hidden" name="created_by" value="#variables.user_identification#" />
			<input type="hidden" name="fund_id" value="#attributes.fund_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>