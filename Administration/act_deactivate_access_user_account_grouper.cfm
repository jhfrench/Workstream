<!-- Administration/act_deactivate_access_user_account_grouper.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_deactivate_access_user_account_grouper.cfm">
	<responsibilities>
		I deactivate old NSM privileges for a specified user and NSM grouper.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/13/2007" role="FuseCoder" comments="Created File">
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

<cfif isdefined("attributes.affected_center_id") AND len(attributes.affected_center_id)>
	<cfset variables.deactivated_center_id=attributes.affected_center_id>
<cfelseif len(attributes.affected_organization_id)>
	<cfif isdefined("attributes.apply_to_children_ind")>
		<cfsavecontent variable="variables.deactivated_organization_id">
		<cfoutput>
		SELECT organization_id
		FROM REF_Organization
		WHERE organization_id IN (#attributes.affected_organization_id#)
		UNION ALL
		/* if the user so specifies, apply indicated access to children NSM entities */
		<!--- $issue$: convert from Oracle-specific START WITH/CONNECT BY to Postgres recursive query --->
		SELECT Hierarchy_Assignment.organization_id
		FROM Hierarchy_Assignment
			INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
			INNER JOIN REF_Organization ON Hierarchy_Assignment.organization_id=REF_Organization.organization_id
				AND Hierarchy_Assignment.active_ind=1
				AND Link_Program_Year_Hierarchy.active_ind=1
				AND REF_Organization.active_ind=1
				AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
		START WITH Hierarchy_Assignment.parent_organization_id IN (#attributes.affected_organization_id#)
		CONNECT BY PRIOR Hierarchy_Assignment.organization_id=Hierarchy_Assignment.parent_organization_id
		</cfoutput>
		</cfsavecontent>
	<cfelse>
		<cfset variables.deactivated_organization_id=attributes.affected_organization_id>
	</cfif>
<cfelse>
	<cfset variables.deactivated_organization_id=0>
</cfif>

<!--- deactivate old assignments --->
<cfinclude template="qry_deactivate_access_user_account_grouper.cfm">