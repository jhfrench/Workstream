
<!--Customers/act_update_customer.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update all the information associated with the 'Edit Customer' screen.

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:45:33  daugherty
	Initial revision

	Revision 1.2  2002-01-08 18:33:26-05  french
	Old code was evaluating Emp_Contact.disable, a field that does not exist in the workstream data model. Modified code to account for this.

	Revision 1.1  2001-11-15 10:13:05-05  long
	Changed the isolation level from Serializable to read_committed
	||
	END FUSEDOC --->
<cftransaction isolation="READ_COMMITTED">
<!--- I update the customers table with the information that is only located on the customers table --->
<cfquery name="update_customers" datasource="#application.datasources.main#">
UPDATE Customers
SET root_code='#attributes.root_code#',
	description='#attributes.description#', 
	company_id=#attributes.company_id#,
	active_ind=#attributes.active_id#,<cfif len(company_address1)>
	company_address1='#attributes.company_address1#',</cfif><cfif len(company_address2)>
	company_address2='#attributes.company_address2#',</cfif><cfif len(company_city)>
	company_city = '#attributes.company_city#',</cfif>
	company_state='#attributes.company_state#'<cfif len(company_zip)>,
	company_zip ='#attributes.company_zip#'</cfif>
WHERE customers_id=#attributes.customers_id#
</cfquery>
<cfquery name="update_projects" datasource="#application.datasources.main#">
UPDATE Project
SET root_code='#attributes.root_code#',
	project_code='#attributes.root_code#'+RIGHT(project_code,LEN(project_code)-4)
WHERE customers_id=#attributes.customers_id#
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
<!--- If the person is already in the system as a billing contact, update the customers table to reference the existing contact --->	
	<cfif len(get_contact_name.emp_id)>
		<cfquery name="update_emp_contact" datasource="#application.datasources.main#">
		UPDATE Customers
	    SET emp_contact_id=#get_contact_name.emp_id#
	    WHERE customers_id=#attributes.customers_id#
		</cfquery>
	<!--- If the person doesn't exist in the system, insert him into the system --->	
	<cfelse>
			<cfquery name="insert_new_contact" datasource="#application.datasources.main#">
			INSERT INTO emp_contact (name, lname, emp_contact_type)
			VALUES ('#attributes.name#', '#attributes.lname#', 4)
			</cfquery>
	<!--- and  update the customers table with the new contact information --->		
			<cfquery name="update_customer" datasource="#application.datasources.main#">
			UPDATE Customers
			SET emp_contact_id=(SELECT MAX(emp_id) AS emp_contact_id FROM Emp_Contact)
			WHERE customers_id=#attributes.customers_id#
			</cfquery>
	</cfif>
<!---This is if the form is empty for contact information --->	
<cfelse>
	<cfquery name="get_contact" datasource="#application.datasources.main#">
	SELECT emp_contact_id
	FROM customers
	WHERE customers_id=#attributes.customers_id#
	</cfquery>
	<cfif len(get_contact.emp_contact_id)>
		<cfquery name="remove_contact" datasource="#application.datasources.main#">
		UPDATE customers
		SET emp_contact_id=NULL
		WHERE customers_id=#attributes.customers_id#    
		</cfquery>
	</cfif>
</cfif>
<!--- Update the visible to table, by deleting all the existing entries and then looping through the list of companies that 
the customer is visible to and insert them into the table. --->
<cfquery name="delete_old" datasource="#application.datasources.main#">
DELETE FROM Customer_Visible_To
WHERE code='#attributes.root_code#'
</cfquery>
<cfloop index="ii" list="#attributes.visible_to#">
	<cfquery name="insert_visible_to" datasource="#application.datasources.main#">
	INSERT INTO customer_visible_to (code, visible_to)
	VALUES ('#attributes.root_code#', #ii#)
	</cfquery>
</cfloop>
</cftransaction>
</cfsilent>

