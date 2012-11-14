
<!--Customers/act_update_customer.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update all the information associated with the 'Edit Customer' screen.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cftransaction isolation="READ_COMMITTED">
<!--- I update the Customer table with the information that is only located on the Customer table --->
<cfoutput>
<pre>
UPDATE Customer
SET root_code='#attributes.root_code#',
	description='#attributes.description#', 
	company_id=#attributes.company_id#,
	active_ind=#attributes.active_ind#,
	company_address1='#attributes.company_address1#',
	company_address2='#attributes.company_address2#',
	company_city = '#attributes.company_city#',
	company_state='#attributes.company_state#',
	company_zip='#attributes.company_zip#'
WHERE customer_id=#attributes.customer_id#
</pre>
</cfoutput>
<cfquery name="update_customers" datasource="#application.datasources.main#">
UPDATE Customer
SET root_code='#attributes.root_code#',
	description='#attributes.description#', 
	company_id=#attributes.company_id#,
	active_ind=#attributes.active_ind#,
	company_address1='#attributes.company_address1#',
	company_address2='#attributes.company_address2#',
	company_city = '#attributes.company_city#',
	company_state='#attributes.company_state#',
	company_zip='#attributes.company_zip#'
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
	SELECT user_account_id
	FROM Demographics
		INNER JOIN User_Account ON Demographics.user_account_id=User_Account.user_account_id
			AND User_Account.account_type_id=2
	WHERE Demographics.active_ind=1
		AND Demographics.first_name='#attributes.first_name#'
		AND Demographics.last_name='#attributes.last_name#'
	</cfquery>
<!--- If the person is already in the system as a billing contact, update the Customer table to reference the existing contact --->
	<cfif len(get_contact_name.user_account_id)>
		<cfquery name="update_customer_contact" datasource="#application.datasources.main#">
		UPDATE Customer
	    SET contact_user_account_id=#get_contact_name.user_account_id#
	    WHERE customer_id=#attributes.customer_id#
		</cfquery>
	<!--- If the person doesn't exist in the system, insert him into the system --->
	<cfelse>
		<cfquery name="insert_user_account" datasource="#application.datasources.main#">
		INSERT INTO User_Account (user_name, account_type_id)
		VALUES ('#left(attributes.first_name,1)##attributes.last_name#', 2)
		</cfquery>
		<cfquery name="insert_customer_contact" datasource="#application.datasources.main#">
		INSERT INTO Demographics (first_name, last_name, user_account_id)
		VALUES ('#attributes.first_name#', '#attributes.last_name#', CURRVAL('User_Account_user_account_id_SEQ'))
		</cfquery>
	<!--- and  update the Customer table with the new contact information --->
			<cfquery name="update_customer" datasource="#application.datasources.main#">
			UPDATE Customer
			SET contact_user_account_id=CURRVAL('User_Account_user_account_id_SEQ')
			WHERE customer_id=#attributes.customer_id#
			</cfquery>
	</cfif>
<!---This is if the form is empty for contact information --->
<cfelse>
	<cfquery name="get_contact" datasource="#application.datasources.main#">
	SELECT contact_user_account_id
	FROM Customer
	WHERE customer_id=#attributes.customer_id#
	</cfquery>
	<cfif len(get_contact.contact_user_account_id)>
		<cfquery name="remove_contact" datasource="#application.datasources.main#">
		UPDATE Customer
		SET contact_user_account_id=NULL
		WHERE customer_id=#attributes.customer_id#
		</cfquery>
	</cfif>
</cfif>
<!--- Update the visible to table, by deleting all the existing entries and then looping through the list of companies that 
the customer is visible to and insert them into the table. --->
<cfquery name="delete_old" datasource="#application.datasources.main#">
DELETE FROM Link_Customer_Company
WHERE customer_id=#attributes.customer_id#
</cfquery>
<cfquery name="insert_company_id" datasource="#application.datasources.main#">
<cfloop index="ii" list="#attributes.visible_to_company_id#">
	INSERT INTO Link_Customer_Company (customer_id, company_id)
	VALUES (#attributes.customer_id#, #ii#);
</cfloop>
</cfquery>
</cftransaction>