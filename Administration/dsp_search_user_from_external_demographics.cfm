<!-- Administration/dsp_search_user_from_external_demographics.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_search_user_from_external_demographics.cfm">
	<responsibilities>
		I display the search form the administrator uses to get user information from external demographics warehouse.
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

<!--- get list of centers --->
<cfinclude template="../common_files/qry_get_ref_center.cfm">
<cfparam name="attributes.last_name" default="">
<cfparam name="attributes.center_description" default="">
<cfparam name="variables.display_message" default="">
<cfparam name="attributes.method" default="">

<cfif NOT comparenocase(attributes.method,"search")>
<!--- check if the user selects a center --->
	<cfif NOT len(attributes.center_description)>
		<cfset variables.display_message=variables.display_message & "<li>Please select a center">
	</cfif>
	<!--- check if the user enters a last name --->
	<cfif NOT len(attributes.last_name)>
		<cfset variables.display_message=variables.display_message & "<li>Please enter lastname">
	</cfif>
	<!--- if the user selects a center and enters a lastname then process in external demographics warehouse --->
	<cfif NOT len(variables.display_message)>
		<cfinclude template="act_search_user_from_external_demographics.cfm">
	</cfif>
</cfif>


<cfoutput>
#variables.display_message#
<form name="search_user_from_external_demographics_form" action="index.cfm?fuseaction=#attributes.fuesaction#" method="post">
<table width="400" border="0" cellspacing="2" cellpadding="2" summary="Table displays user search select">
	<tr>
		<th colspan="2">Search for a user from external_demographics information.</th>
	</tr>
	<tr>
		<td width="79"><label for="center_description">Center</label></td>
		<td width="307">
			<select name="center_description" tabindex="1">
				<option value="">Select a center</option>
				<cfloop query="get_ref_center">
				<option value="#description#">#abbreviation#</option>
				</cfloop>
			</select>
		</td>
	</tr>
	<tr>
		<td><label for="last_name">Last Name</label></td>
		<td><input name="last_name" type="text" value="#attributes.last_name#" size="20"  maxlength="4000" tabindex="2" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<input name="method" type="submit" alt="Search" value="Search" tabindex="3" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
</form>
</cfoutput>
