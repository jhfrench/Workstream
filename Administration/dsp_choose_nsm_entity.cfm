<!-- Administration/dsp_choose_nsm_entity.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_choose_nsm_entity.cfm">
	<responsibilities>
		I help the user maintain the NSM structure.
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

<cfinclude template="../common_files/qry_get_nsm_hierarchy_organizations.cfm">

<tr bgcolor="#808080">
	<th>Edit</th>
	<th><abbr title="NASA Structure Management">NSM</abbr> Organization</th>
</tr>
<cfif get_nsm_hierarchy_organizations.recordcount>
	<cfoutput query="get_nsm_hierarchy_organizations">
		<tr bgcolor="##dcdcdc">
			<td>
				<input type="radio" name="organization_id" value="#organization_id#" id="#organization_id#"/>
			</td>
			<td><label for="#organization_id#"><cfloop from="1" to="#hierarchy_level#" index="ii">&nbsp;&nbsp;</cfloop>#organization_description# (#organization_code#)</label></td>
		</tr>
	</cfoutput>
<cfelse>
	<cfset variables.show_button_ind=0>
	<tr bgcolor="#dcdcdc">
		<td colspan="2">There are no organizations available to edit for the specified program year.</th>
	</tr>
</cfif>