
<!--qry_get_product_access.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the products that user has access to.

	||
	Edits:
$Log$
Revision 1.0  2005/02/15 20:54:37  daugherty
Initial revision

Revision 1.2  2001-10-15 12:17:54-04  french
Optimizing queries by removing join to security table (replaced username lookup with emp_id from previous query).

Revision 1.1  2001-10-11 11:04:56-04  long
Added $log $ for edits to all CFM files that have fusedocs.
	||
	Variables:
	END FUSEDOC --->
<cfquery name="get_product_access" datasource="#application.datasources.main#">
SELECT Security_Product_Access.product_id, REF_Product.Product_Name AS pn
FROM REF_Product, Security_Product_Access
WHERE REF_Product.product_id=Security_Product_Access.product_id
	AND Security_Product_Access.emp_id=#general_user_info.emp_id#
</cfquery>
</cfsilent>

