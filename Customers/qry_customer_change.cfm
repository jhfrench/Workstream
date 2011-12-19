
<!--Customers/qry_customer_change.cfm
	Author: Jeromy F  -->
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
SELECT REF_companies.Company, Customer.root_code, Customer.company_id,
    Customer.description, REF_Active_Indicator.Active_Ind_Type, Customer.active_ind,
    Customer.company_address1, Customer.customer_id,
    Customer.Company_address2, Customer.Company_city, 
    Customer.Company_State, Customer.Company_zip, 
    Customer.Emp_Contact_ID, Emp_Contact.Name, 
    Emp_Contact.LName
FROM Customer
	INNER JOIN REF_companies ON Customer.Company_ID = REF_companies.Company_ID
	INNER JOIN REF_Active_Indicator ON  Customer.Active_ID = REF_Active_Indicator.Active_Ind
	LEFT OUTER JOIN Emp_Contact ON Customer.Emp_Contact_ID = Emp_Contact.Emp_ID
WHERE customer_id = #attributes.customer_id#  
</cfquery>
