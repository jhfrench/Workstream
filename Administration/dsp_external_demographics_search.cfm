<!-- Administration/dsp_external_demographics_search.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_external_demographics_search.cfm">
	<responsibilities>
		I display the result of the center and dlastname search of external demographics warehouse. I also allow a selection for further processing.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="variables.display_message" default="">
<cfmodule template="../common_files/qry_get_ref_center.cfm" display_all_centers_ind="1">

<cfoutput>
<cfif len(variables.display_message)>
	<ul>#variables.display_message#</ul>
</cfif>
<form name="search_user_from_external_demographics_form" action="index.cfm?fuseaction=Administration.add_user" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellpadding="3" cellspacing="0" width="100%" border="0" summary="Table displays user search criteria.">
	<tr bgcolor="##999999">
		<th colspan="2">Search for a user from the demographics warehouse:</th>
	</tr>
	<tr bgcolor="##eeeeee">
		<td width="20%"><label for="center">Center</label>:</td>
		<td width="80%">
			<select name="center_description" id="center">
				<option value="">Select a center</option>
				<cfloop query="get_ref_center">
				<option value="#abbreviation#">#abbreviation#</option>
				</cfloop>
			</select>
		</td>
	</tr>
	<tr bgcolor="##eeeeee">
		<td width="20%"><label for="last_name">Last Name</label>:</td>
		<td width="80%"><input name="last_name" id="last_name" type="text" value="#attributes.last_name#" size="50" maxlength="50" /></td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center" colspan="2">
			<input type="submit" name="method" value="Search" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</form>
</cfoutput>