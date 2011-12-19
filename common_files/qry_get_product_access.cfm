
<!--qry_get_product_access.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the products that user has access to.

	||
	Edits:
	$Log$
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

