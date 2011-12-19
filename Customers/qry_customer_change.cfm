
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
SELECT REF_companies.Company, Customers.Root_Code, Customers.company_id,
    Customers.Description, REF_Active_Indicator.Active_Ind_Type, customers.active_ID,
    Customers.Company_address1, customers.customers_id,
    Customers.Company_address2, Customers.Company_city, 
    Customers.Company_State, Customers.Company_zip, 
    Customers.Emp_Contact_ID, Emp_Contact.Name, 
    Emp_Contact.LName
FROM Customers INNER JOIN
    REF_companies ON 
    Customers.Company_ID = REF_companies.Company_ID INNER JOIN
    REF_Active_Indicator ON 
    Customers.Active_ID = REF_Active_Indicator.Active_Ind LEFT OUTER
     JOIN
    Emp_Contact ON 
    Customers.Emp_Contact_ID = Emp_Contact.Emp_ID
WHERE customers_id = #attributes.customers_id#  
</cfquery>
