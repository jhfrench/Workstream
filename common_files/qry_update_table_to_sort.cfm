<!-- common_files/qry_update_table_to_sort.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_update_table_to_sort.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="7/3/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="update_table_to_sort" datasource="#application.datasources.main#">
UPDATE #attributes.table_to_sort#
SET sort_order=Sorter.sorter_id
FROM #attributes.table_to_sort#
	INNER JOIN Sorter ON #attributes.table_to_sort#.#attributes.id_of_sorted_column#=Sorter.id_of_sorted_column
</cfquery>