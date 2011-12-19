
<!--common_files/qry_get_products.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all of the information from the REF_Product table.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery name="get_products" datasource="#application.datasources.main#">
SELECT *
FROM REF_Product
ORDER BY product_name
</cfquery>
</cfsilent>

