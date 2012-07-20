<!-- Administration/dsp_external_demographics_search.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_external_demographics_search.cfm">
	<responsibilities>
		I display the result of the center and dlastname search of external demographics warehouse. I also allow a selection for further processing.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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

<cfoutput>
<cfif len(variables.display_message)>
<ul>
#variables.display_message#
</ul>
</cfif>

<cfmodule template="../common_files/qry_get_ref_center.cfm" display_all_centers_ind="1">

<form name="search_user_from_external_demographics_form" action="index.cfm?fuseaction=Administration.add_user" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong>Add User</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0"  summary="Table displays user search">
			<tr>
				<th colspan="2">Search for a user from the demographics warehouse:</th>
			</tr>
			<tr>
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
			<tr>
				<td width="20%"><label for="last_name">Last Name</label>:</td>
				<td width="80%"><input name="last_name" id="last_name" type="text" value="#attributes.last_name#" size="50" maxlength="50"/></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input name="method" type="submit" alt="Search" value="Search" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</form>
</cfoutput>