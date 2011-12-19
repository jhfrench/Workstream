<!-- Administration/act_insert_access_user_account_grouper.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_insert_access_user_account_grouper.cfm">
	<responsibilities>
		I assign NSM structure privileges.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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

<!--- compile SQL that will enter new assignments --->
<cfoutput>
<cfsavecontent variable="variables.sql_insert_access_user_account_grouper">
<cfloop list="#attributes.user_account_id#" index="user_account_id_ii">
	<cfloop list="#variables.relevant_privileges#" index="variables.privilege_id_ii">
		<!--- if we're dealing with organization privileges --->
		<cfif isdefined("attributes.privilege_#variables.privilege_id_ii#_organization_id")>
			<cfloop list="#evaluate('attributes.privilege_#privilege_id_ii#_organization_id')#" index="variables.organization_id_ii">
			SELECT #attributes.program_year_id#, #attributes.module_id#, #user_account_id_ii#,
				#variables.organization_id_ii#, NULL AS center_id, #variables.privilege_id_ii#,
				#session.user_account_id#
			FROM Dual
			UNION ALL
			<cfif isdefined("attributes.apply_to_children_ind")>
			/* if the user so specifies, apply indicated access to children NSM entities */
			SELECT #attributes.program_year_id#, #attributes.module_id#, #user_account_id_ii#,
				Hierarchy_Assignment.organization_id, NULL AS center_id, #variables.privilege_id_ii#,
				#session.user_account_id#
			FROM Hierarchy_Assignment
				INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
				INNER JOIN REF_Organization ON Hierarchy_Assignment.organization_id=REF_Organization.organization_id
					AND Hierarchy_Assignment.active_ind=1
					AND Link_Program_Year_Hierarchy.active_ind=1
					AND REF_Organization.active_ind=1
					AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
			START WITH Hierarchy_Assignment.parent_organization_id IN (#variables.organization_id_ii#) CONNECT BY PRIOR Hierarchy_Assignment.organization_id=Hierarchy_Assignment.parent_organization_id
			UNION ALL
			</cfif>
			</cfloop>
		<!--- if we're dealing with center privileges --->
		<cfelseif isdefined("attributes.privilege_#variables.privilege_id_ii#_center_id")>
			<cfloop list="#evaluate('attributes.privilege_#variables.privilege_id_ii#_center_id')#" index="variables.center_id_ii">
			SELECT #attributes.program_year_id#, #attributes.module_id#, #user_account_id_ii#,
				#attributes.nsm_drilldown_organizations# AS organization_id, #variables.center_id_ii# AS center_id, #variables.privilege_id_ii#,
				#session.user_account_id#
			FROM Dual
			UNION ALL
			</cfloop>
		</cfif>
	</cfloop>
</cfloop>
SELECT 1, 1, 1,
	1, 1, 1,
	1
FROM Dual
WHERE 1=0 /*this will never be true, but it ensures that valid SQL will be passed to the DB*/
</cfsavecontent>
</cfoutput>

<!--- enter new assignments --->
<cfinclude template="qry_insert_access_user_account_grouper.cfm">