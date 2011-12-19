<!-- Administration/qry_get_ref_tables.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_tables.cfm">
	<responsibilities>
		I show a list of reference tables that can be administered by developers.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/17/2009" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 9/15/9)
			Modifying query to be able to work in development, SEF and Production.
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

<cfquery name="get_ref_tables" datasource="#application.datasources.main#">
SELECT All_Tab_Columns.table_name, NVL(REF_Screen.fuseaction,'Not_Defined') AS fuseaction, 
LOWER(All_Tab_Columns.table_name) AS lower_table_name, 
	COUNT(*) AS column_count
FROM All_Tab_Columns 
	LEFT OUTER JOIN REF_Screen ON 'Administration.edit_'||LOWER(All_Tab_Columns.table_name)=REF_Screen.fuseaction 
WHERE All_Tab_Columns.table_name NOT LIKE 'BIN$%' 
	AND All_Tab_Columns.table_name LIKE 'REF_%' 
	AND All_Tab_Columns.owner = '#application.product_name#_APPL'
GROUP BY All_Tab_Columns.table_name, REF_Screen.fuseaction 
ORDER BY All_Tab_Columns.table_name
</cfquery>