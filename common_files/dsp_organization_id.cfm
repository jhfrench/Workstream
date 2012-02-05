<!-- common_files/dsp_organization_id.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_organization_id.cfm">
	<responsibilities>
		I display the my FAAD page to the user
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="3/23/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.limit_to_user_access_ind" default="0">
<cfparam name="attributes.module_id" default="#caller.get_screen_details.module_id#">
<cfparam name="attributes.privilege_id" default="2">
<cfparam name="attributes.select_multiple_ind" default="0">
<cfparam name="attributes.selected" default="0">
<cfif attributes.limit_to_user_access_ind>
	<cfmodule template="qry_get_ref_organization.cfm" limit_to_user_access_ind="1" module_id="#attributes.module_id#" program_year_id="1" privilege_id="#attributes.privilege_id#">
<cfelse>
	<cfinclude template="qry_get_ref_organization.cfm">
</cfif>
<label for="organization_id">Organizational Unit</label>:<br />
<cfselect name="organization_id" id="organization_id" query="get_ref_organization" value="organization_id" display="description" selected="#attributes.selected#" size="5" multiple="#attributes.select_multiple_ind#" required="yes" message="Please specify an organizational unit.">
</cfselect>