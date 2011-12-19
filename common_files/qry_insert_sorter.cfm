<!-- common_files/qry_insert_sorter.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_sorter.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/28/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
			attributes.table_to_sort: source of data that is being sorted
			attributes.id_of_sorted_column: primary key of table that is being sorted
			attributes.text_of_sorted_column: text description; default order by
			attributes.where: criteria used to limit data being sorted
			attributes.order_by: optional; if provided this is used to order the data (and is used instead of the attributes.text_of_sorted_column default)
		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->

<cfquery name="insert_sorter" datasource="#application.datasources.main#">
INSERT INTO Sorter (id_of_sorted_column, text_of_sorted_column)
SELECT #attributes.id_of_sorted_column#, #attributes.text_of_sorted_column#
FROM #attributes.table_to_sort#<cfif len(attributes.where)>
WHERE #attributes.table_to_sort#.#attributes.where#</cfif>
ORDER BY <cfif len(attributes.order_by)>#attributes.order_by#<cfelse>UPPER(#attributes.text_of_sorted_column#)</cfif>
</cfquery>