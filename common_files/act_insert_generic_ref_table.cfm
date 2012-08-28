<!-- common_files/act_insert_generic_ref_table.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_insert_generic_ref_table.cfm">
	<responsibilities>
		I populate the REF_Procurement_Type table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/16/2007" role="FuseCoder" comments="Created File">
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

<!--- create new REF_Procurement_Type records after making sure the new procurement_type is not already in the database --->
<cfquery name="insert_#lcase(attributes.destination_table)#" datasource="#application.datasources.main#">
INSERT INTO #attributes.destination_table# (#attributes.destination_column#, created_by)
SELECT #attributes.source_table#.#attributes.source_column#, #variables.user_identification#
FROM #attributes.source_table#
WHERE #attributes.source_table#.active_ind=1
	AND #attributes.source_table#.#attributes.source_column# IS NOT NULL
	AND #attributes.source_table#.#attributes.source_column# NOT IN (
		SELECT #attributes.destination_column#
		FROM #attributes.destination_table#
		)
GROUP BY #attributes.source_table#.#attributes.source_column#
</cfquery>

<cfif isdefined("attributes.sort_column")>
	<!--- general ordering --->
	<cfmodule template="../common_files/act_administer_sorter_table.cfm" table_to_sort="#attributes.destination_table#" id_of_sorted_column="#lcase(right(attributes.destination_table,len(attributes.destination_table)-4))#_id" text_of_sorted_column="#attributes.destination_column#">
</cfif>