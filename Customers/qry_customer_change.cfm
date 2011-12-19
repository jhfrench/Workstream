
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
SELECT REF_Company.description AS company, Customer.root_code, Customer.company_id,
	Customer.description, REF_Active_Indicator.Active_Ind_Type, Customer.active_ind,
	Customer.company_address1, Customer.customer_id, Customer.Company_address2,
	Customer.Company_city, Customer.Company_State, Customer.Company_zip, 
	Customer.Emp_Contact_ID, Emp_Contact.Name, Emp_Contact.LName
FROM Customer
	INNER JOIN REF_Company ON Customer.company_id = REF_Company.company_id
	INNER JOIN REF_Active_Indicator ON  Customer.Active_ID = REF_Active_Indicator.Active_Ind
	LEFT OUTER JOIN Emp_Contact ON Customer.Emp_Contact_ID = Emp_Contact.emp_id
WHERE Customer.customer_id = #attributes.customer_id#  
</cfquery>
