<!-- Administration/qry_deactivate_link_program_year_hierarchy.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_link_program_year_hierarchy.cfm">
	<responsibilities>
		Query to deactivate a record in Link_Program_Year_Hierarchy table before a new insert.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="7/6/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_link_program_year_hierarchy" datasource="#application.datasources.main#">
UPDATE Link_Program_Year_Hierarchy
SET active_ind=0
WHERE active_ind=1
	AND l_p_y_h_id=#attributes.l_p_y_h_id#
</cfquery>