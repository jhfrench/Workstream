<!-- common_files/qry_get_center_l_p_y_h_id.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_center_l_p_y_h_id.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="4/22/2008" role="FuseCoder" comments="Created File">
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
<cfquery name="get_center_l_p_y_h_id" datasource="#application.datasources.main#">
SELECT l_p_y_h_id
FROM Link_Program_Year_Hierarchy
	INNER JOIN REF_Hierarchy_Level ON Link_Program_Year_Hierarchy.hierarchy_level_id=REF_Hierarchy_Level.hierarchy_level_id
WHERE Link_Program_Year_Hierarchy.active_ind=1
	AND REF_Hierarchy_Level.center_ind=1
	AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
</cfquery>