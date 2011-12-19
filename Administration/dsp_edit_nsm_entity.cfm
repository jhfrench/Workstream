<!-- Administration/dsp_edit_nsm_entity.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_nsm_entity.cfm">
	<responsibilities>
		I help the user maintain the NSM structure.
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

<cfinclude template="qry_get_nsm_entity.cfm">

<cfquery name="get_entity_associated_data_counts" datasource="#application.datasources.main#">
SELECT ISNULL(SUM(ISNULL(active_ind,0)),0) AS count1
FROM Variance_Explanation
WHERE organization_id=#attributes.organization_id#
UNION ALL
SELECT ISNULL(SUM(ISNULL(active_ind,0)),0) AS count1
FROM Phasing_Plan
WHERE organization_id=#attributes.organization_id#
</cfquery>

<cfmodule template="../common_files/qry_get_ref_organization.cfm" organization_id="0">

<cfoutput query="get_nsm_entity">

	<tr bgcolor="##dcdcdc">
		<td><label for="parent_organization_id">Parent</label></td>
		<td>
			<cfselect name="parent_organization_id" query="get_ref_organization" value="organization_id" display="drop_down_display" selected="#get_nsm_entity.parent_organization_id#" id="parent_organization_id" required="yes" message="Please specify the parent of this NSM organization.">
				<option value="0"<cfif NOT len(get_nsm_entity.parent_organization_id)> selected</cfif>>This organization has no parent</option>
			</cfselect>
		</td>
	</tr>
	<tr bgcolor="##dcdcdc">
		<td><label for="description">Name</label></td>
		<td>
			<cfinput type="text" name="description" value="#description#" id="description" size="100" maxlength="4000" required="yes" message="Please specify the name of this NSM organization.">
		</td>
	</tr>
	<tr bgcolor="##dcdcdc">
		<td><label for="organization_code"></label>Code</td>
		<td>
			#organization_code#
		</td>
	</tr>
	<cfif get_nsm_entity.organization_id NEQ 0 AND listlast(listsort(valuelist(get_entity_associated_data_counts.count1),"numeric")) EQ 0>
	<tr bgcolor="##dcdcdc">
		<td><label for="delete"></label>Delete</td>
		<td>
			<input type="checkbox" name="delete_hierarchy_assignment_ind" value="1" id="delete"/>
		</td>
	</tr>
	</cfif>
	<input type="hidden" name="organization_id" value="#get_nsm_entity.organization_id#"/>
	<input type="hidden" name="hierarchy_assignment_id" value="#hierarchy_assignment_id#"/>
</cfoutput>