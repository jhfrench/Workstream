<!-- Requirements/dsp_screen_requirements.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_screen_requirements.cfm">
	<responsibilities>
		I display the form for showing requirements for the page the user is viewing.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<hr width="100%" />
<cfinclude template="qry_get_screen_requirements.cfm">
<form name="mark_requirement_complete" action="index.cfm?fuseaction=Requirements.mark_requirement_complete" target="mark_requirement_complete" method="post">
<table bgcolor="#FFFFFF" border="1" cellpadding="3" cellspacing="0" cols="6" width="100%" summary="table displays screent requirements">
	<tr bgcolor="#999999">
		<td align="left" colspan="6">
			<h4>Requirements</h4>
		</td>
	</tr>
	<tr bgcolor="#999999">
		<th>Level</th>
		<th>Business Function</th>
		<th>Type</th>
		<th>Completed</th>
		<th>Requirement</th>
		<th>Requested Release</th>
	</tr>
	<cfif get_screen_requirements.recordcount EQ 0>
	<tr>
		<td colspan="6">No requirements listed for this page</td>
	</tr>
	<cfelse>
	<cfoutput query="get_screen_requirements">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cccccc';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
		<td>#requirement_level#</td>
		<td>#business_function#</td>
		<td>#requirement_type#</td>
		<td align="center"><input type="checkbox" name="requirement_coded_ind" id="requirement_coded_ind_#l_s_r_id#" value="#l_s_r_id#"<cfif requirement_coded_ind> checked="checked"</cfif> /></td>
		<td><a href="index.cfm?fuseaction=Requirements.edit_requirement&requirement_id=#requirement_id#">#requirement_number#</a> <label for="requirement_coded_ind_#l_s_r_id#">#requirement#</label></td>
		<td>#product_version#</td>
	</tr>
	</cfoutput>
	<cfoutput>
	<tr bgcolor="##999999">
		<td align="center" colspan="6">
			<input type="hidden" name="affected_requirements" value="#valuelist(get_screen_requirements.l_s_r_id)#" />
			<input type="submit" alt="submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
	</cfoutput>
	</cfif>
</table>
</form>
<form name="change_requirement_listing_options" action="index.cfm?fuseaction=Requirements.change_requirement_listing_options" target="change_requirement_listing_options" method="post">
<table bgcolor="#FFFFFF" cellpadding="3" cellspacing="0" width="100%" border="1" summary="table gives criteria for requirements display in preceding table">
	<cfoutput>
	<tr>
		<td>
			<input type="checkbox" name="hide_general_requirements" id="hide_general_requirements" value="1"<cfif session.hide_general_requirements> checked="checked"</cfif> /><label for="hide_general_requirements">Hide system-wide requirements</label>
		</td>
		<td>
			<input type="checkbox" name="hide_module_all" id="hide_module_all" value="1"<cfif session.hide_module_all> checked="checked"</cfif> /><label for="hide_module_all">Hide general module requirements</label>
		</td>
		<td>
			<input type="checkbox" name="hide_coded_requirements" id="hide_coded_requirements" value="1"<cfif session.hide_coded_requirements> checked="checked"</cfif> /><label for="hide_coded_requirements">Hide completed requirements</label>
		</td>
	</tr>
	<tr>
		<td align="center" colspan="3">
			<input type="submit" alt="submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
	</cfoutput>
	<!--- add link 'Add New Requirement'  --->
	<tr>
		<td colspan="3" align="left" class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});">
			<a href="index.cfm?fuseaction=Requirements.edit_requirement&requirement_id=0">Add New Requirement</a> | <a href="index.cfm?fuseaction=Requirements.requirements_document" target="requirements">View all requirements</a>
		</td>
	</tr>
</table>
</form>

