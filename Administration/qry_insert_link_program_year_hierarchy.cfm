<!-- Administration/qry_insert_link_program_year_hierarchy.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_link_program_year_hierarchy.cfm">
	<responsibilities>
		Query to insert a record into Link_Program_Year_Hierarchy table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/6/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_link_program_year_hierarchy" datasource="#application.datasources.main#">
INSERT INTO Link_Program_Year_Hierarchy (hierarchy_level_id, program_year_id, created_by,
	active_ind, sort_order)
VALUES ('#attributes.hierarchy_level_id#', #attributes.program_year_id#, #variables.user_identification#,
	#attributes.active_ind#, #attributes.sort_order#)
</cfquery>