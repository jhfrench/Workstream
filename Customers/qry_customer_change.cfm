
<!--Customers/qry_customer_change.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the company information for populating the edit customer screen
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfquery name="customer_change" datasource="#application.datasources.main#">
SELECT REF_Company.description AS company, Customer.root_code, Customer.company_id,
	Customer.description, REF_Active_Indicator.active_ind_Type, Customer.active_ind,
	Customer.company_address1, Customer.customer_id, Customer.Company_address2,
	Customer.Company_city, Customer.Company_State, Customer.Company_zip, 
	Customer.contact_user_account_id, Demographics.first_name, Demographics.last_name
FROM Customer
	INNER JOIN REF_Company ON Customer.company_id=REF_Company.company_id
	INNER JOIN REF_Active_Indicator ON Customer.active_ind=REF_Active_Indicator.active_ind
	LEFT OUTER JOIN Demographics ON Customer.contact_user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Customer.customer_id=#attributes.customer_id#
</cfquery>
