
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
<!--- <cfoutput>
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
</cfoutput> --->
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
<!--- See if the fields for first and last name are populated on the form. --->
<cfif len(attributes.first_name) OR len(attributes.last_name)>
<!--- see if the name entered exists in the database as a billing contact --->
	<cfquery name="get_contact_name" datasource="#application.datasources.main#">
	SELECT user_account_id
	FROM Demographics
	WHERE Demographics.active_ind=1
		AND Demographics.first_name='#attributes.first_name#'
		AND Demographics.last_name='#attributes.last_name#'
	</cfquery>
	<cfset attributes.contact_user_account_id=get_contact_name.user_account_id>
	<!--- If the person doesn't exist in the system, insert him into the system --->
	<cfif NOT len(get_contact_name.user_account_id)>
		<cfquery name="insert_user_account" datasource="#application.datasources.main#">
		INSERT INTO User_Account (user_name, account_type_id, created_by)
		VALUES ('#left(attributes.first_name,1)##attributes.last_name#', 2, #variables.user_identification#);
		SELECT CURRVAL('User_Account_user_account_id_SEQ') AS user_account_id;
		</cfquery>
		<cfset attributes.contact_user_account_id=insert_user_account.user_account_id>
		<cfquery name="insert_customer_contact" datasource="#application.datasources.main#">
		INSERT INTO Demographics (first_name, last_name, user_account_id,
			created_by)
		VALUES ('#attributes.first_name#', '#attributes.last_name#', #attributes.contact_user_account_id#,
			#variables.user_identification#)
		</cfquery>
	</cfif>
	<cfquery name="update_customer_contact" datasource="#application.datasources.main#">
	UPDATE Customer
	SET contact_user_account_id=#attributes.contact_user_account_id#
	WHERE customer_id=#attributes.customer_id#
	</cfquery>
<!---This is if the form is empty for contact information --->
<cfelse>
	<cfquery name="remove_customer_contact" datasource="#application.datasources.main#">
	UPDATE Customer
	SET contact_user_account_id=NULL
	WHERE customer_id=#attributes.customer_id#
		AND contact_user_account_id IS NOT NULL
	</cfquery>
</cfif>
<!--- Update the visible to table, by deleting all the existing entries and then looping through the list of companies that 
the customer is visible to and insert them into the table. --->
<cfset attributes.visible_to_company_id=listappend(0,attributes.visible_to_company_id)>
<cfquery name="update_link_customer_company" datasource="#application.datasources.main#">
UPDATE Link_Customer_Company
SET active_ind=0
WHERE active_ind=1
	AND customer_id=#attributes.customer_id#
	AND company_id NOT IN (#attributes.visible_to_company_id#);

INSERT INTO Link_Customer_Company (customer_id, company_id, created_by)
SELECT #attributes.customer_id#, company_id, #variables.user_identification#
FROM REF_Company
WHERE company_id IN (#attributes.visible_to_company_id#)
	AND company_id NOT IN (
		SELECT company_id
		FROM Link_Customer_Company
		WHERE active_ind=1
			AND customer_id=#attributes.customer_id#
	)
</cfquery>
</cftransaction>