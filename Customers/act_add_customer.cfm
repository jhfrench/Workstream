<!--Customers/act_add_customer.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I do all the inserting of the new customer information to the database.
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cftransaction isolation="READ_COMMITTED">
	<cfif len(attributes.last_name)>
		<cfquery name="insert_user_account" datasource="#application.datasources.main#">
		INSERT INTO User_Account (user_name, account_type_id, created_by)
		VALUES ('#left(attributes.first_name,1)##attributes.last_name#', 2, #variables.user_identification#)
		</cfquery>
		<cfquery name="insert_customer_contact" datasource="#application.datasources.main#">
		INSERT INTO Demographics (first_name, last_name, user_account_id, created_by)
		VALUES ('#attributes.first_name#', '#attributes.last_name#', CURRVAL('User_Account_user_account_id_SEQ'), #variables.user_identification#)
		</cfquery>
		<cfif len(attributes.phone)>
			<cfquery name="insert_contact_phone" datasource="#application.datasources.main#">
			INSERT INTO Phone (phone_number, user_account_id, phone_type_id, created_by)
			VALUES ('#attributes.phone#', CURRVAL('User_Account_user_account_id_SEQ'), 1, #variables.user_identification#)
			</cfquery>
		</cfif>
		<cfif len(attributes.email)>
			<cfquery name="insert_contact_email" datasource="#application.datasources.main#">
			INSERT INTO Email (email, user_account_id, email_type_id, created_by)
			VALUES ('#attributes.email#', CURRVAL('User_Account_user_account_id_SEQ'), 1, #variables.user_identification#)
			</cfquery>
		</cfif>
	</cfif>
	<cfquery name="insert_customer" datasource="#application.datasources.main#">
	INSERT INTO Customer (root_code, description, billable_type_id,
		company_id<cfif len(attributes.company_address1)>, company_address1</cfif><cfif len(attributes.company_address2)>, company_address2</cfif>
		<cfif len(attributes.company_city)>, company_city</cfif>, company_state<cfif len(attributes.company_zip)>, company_zip</cfif>
		<cfif len(attributes.last_name)>, contact_user_account_id</cfif>, active_ind, created_by)
	VALUES ('#variables.new_code#', '#attributes.description#', #attributes.billable_type_id#,
		#attributes.company_id# <cfif len(attributes.company_address1)>, '#attributes.company_address1#'</cfif><cfif len(attributes.company_address2)>, '#attributes.company_address2#'</cfif>
		<cfif len(attributes.company_city)>, '#attributes.company_city#'</cfif>, '#attributes.company_state#'<cfif len(attributes.company_zip)>, '#attributes.company_zip#'</cfif>
		<cfif len(attributes.last_name)>, CURRVAL('User_Account_user_account_id_SEQ')</cfif>, 1, #variables.user_identification#)
	</cfquery>
	<cfquery name="company_id" datasource="#application.datasources.main#">
	INSERT INTO Link_Customer_Company (customer_id, company_id, created_by)
	SELECT CURRVAL('Customer_customer_id_SEQ'), company_id, #variables.user_identification#
	FROM REF_Company
	WHERE company_id IN (<cfif isdefined("attributes.company_id")>#attributes.company_id#<cfelse>#attributes.company_id#</cfif>)
	</cfquery>
</cftransaction>
</cfsilent>
