
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
Revision 1.0  2005/02/15 20:42:04  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:39-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="get_products" datasource="#application.datasources.main#">
SELECT *
FROM REF_Product
ORDER BY product_name
</cfquery>
</cfsilent>

