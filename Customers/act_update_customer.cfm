
<!--Customers/act_update_customer.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update all the information associated with the 'Edit Customer' screen.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cftransaction isolation="READ_COMMITTED">
<!--- I update the Customer table with the information that is only located on the Customer table --->
<cfquery name="update_customers" datasource="#application.datasources.main#">
UPDATE Customer
SET root_code='#attributes.root_code#',
	description='#attributes.description#', 
	company_id=#attributes.company_id#,
	active_ind=#attributes.active_ind#,<cfif len(company_address1)>
	company_address1='#attributes.company_address1#',</cfif><cfif len(company_address2)>
	company_address2='#attributes.company_address2#',</cfif><cfif len(company_city)>
	company_city = '#attributes.company_city#',</cfif>
	company_state='#attributes.company_state#'<cfif len(company_zip)>,
	company_zip ='#attributes.company_zip#'</cfif>
WHERE customer_id=#attributes.customer_id#
</cfquery>
<cfquery name="update_projects" datasource="#application.datasources.main#">
UPDATE Project
SET root_code='#attributes.root_code#',
	project_code='#attributes.root_code#' || RIGHT(project_code,LENGTH(project_code)-4)
WHERE customer_id=#attributes.customer_id#
</cfquery>
<!--- See if the fields for name and Last Name are populate on the form. --->
<cfif len(attributes.name) OR len(attributes.lname)>
<!--- see if the name entered exists in the database as a billing contact --->
	<cfquery name="get_contact_name" datasource="#application.datasources.main#">
	SELECT emp_id
	FROM Emp_Contact
	WHERE name='#attributes.name#'
		AND lname='#attributes.lname#'
		AND emp_contact_type=4    
	</cfquery>	
<!--- If the person is already in the system as a billing contact, update the Customer table to reference the existing contact --->	
	<cfif len(get_contact_name.emp_id)>
		<cfquery name="update_emp_contact" datasource="#application.datasources.main#">
		UPDATE Customer
	    SET emp_contact_id=#get_contact_name.emp_id#
	    WHERE customer_id=#attributes.customer_id#
		</cfquery>
	<!--- If the person doesn't exist in the system, insert him into the system --->	
	<cfelse>
			<cfquery name="insert_new_contact" datasource="#application.datasources.main#">
			INSERT INTO Emp_Contact (name, lname, emp_contact_type)
			VALUES ('#attributes.name#', '#attributes.lname#', 4)
			</cfquery>
	<!--- and  update the Customer table with the new contact information --->		
			<cfquery name="update_customer" datasource="#application.datasources.main#">
			UPDATE Customer
			SET emp_contact_id=(SELECT MAX(emp_id) AS emp_contact_id FROM Emp_Contact)
			WHERE customer_id=#attributes.customer_id#
			</cfquery>
	</cfif>
<!---This is if the form is empty for contact information --->	
<cfelse>
	<cfquery name="get_contact" datasource="#application.datasources.main#">
	SELECT emp_contact_id
	FROM Customer
	WHERE customer_id=#attributes.customer_id#
	</cfquery>
	<cfif len(get_contact.emp_contact_id)>
		<cfquery name="remove_contact" datasource="#application.datasources.main#">
		UPDATE Customer
		SET emp_contact_id=NULL
		WHERE customer_id=#attributes.customer_id#    
		</cfquery>
	</cfif>
</cfif>
<!--- Update the visible to table, by deleting all the existing entries and then looping through the list of companies that 
the customer is visible to and insert them into the table. --->
<cfquery name="delete_old" datasource="#application.datasources.main#">
DELETE FROM Link_Customer_Company
WHERE customer_id='#attributes.customer_id#'
</cfquery>
<cfloop index="ii" list="#attributes.company_id#">
	<cfquery name="insert_company_id" datasource="#application.datasources.main#">
	INSERT INTO Link_Customer_Company (customer_id, company_id)
	VALUES ('#attributes.customer_id#', #ii#)
	</cfquery>
</cfloop>
</cftransaction>
</cfsilent>

