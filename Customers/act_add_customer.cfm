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

<cfinclude template="act_set_root_code.cfm">
<cftransaction isolation="READ_COMMITTED">
	<cfif len(attributes.last_name)>
		<cfquery name="insert_user_account" datasource="#application.datasources.main#">
		INSERT INTO User_Account (user_name, account_type_id, created_by)
		VALUES ('#left(attributes.first_name,1)##attributes.last_name#', 2, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
		RETURNING user_account_id
		</cfquery>
		<cfquery name="insert_demographics" datasource="#application.datasources.main#">
		INSERT INTO Demographics (first_name, last_name, user_account_id, created_by)
		VALUES ('#attributes.first_name#', '#attributes.last_name#', <cfqueryparam value="#insert_user_account.user_account_id#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
		</cfquery>
		<cfif len(attributes.phone)>
			<cfquery name="insert_phone" datasource="#application.datasources.main#">
			INSERT INTO Phone (phone_number, user_account_id, phone_type_id, created_by)
			VALUES ('#attributes.phone#', <cfqueryparam value="#insert_user_account.user_account_id#" cfsqltype="cf_sql_integer" />, 1, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
			</cfquery>
		</cfif>
		<cfif len(attributes.email)>
			<cfquery name="insert_email" datasource="#application.datasources.main#">
			INSERT INTO Email (email, user_account_id, email_type_id, created_by)
			VALUES ('#attributes.email#', <cfqueryparam value="#insert_user_account.user_account_id#" cfsqltype="cf_sql_integer" />, 1, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
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
		<cfif len(attributes.last_name)>, <cfqueryparam value="#insert_user_account.user_account_id#" cfsqltype="cf_sql_integer" /></cfif>, 1, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
	RETURNING customer_id
	</cfquery>
	<cfquery name="insert_link_customer_company" datasource="#application.datasources.main#">
	INSERT INTO Link_Customer_Company (customer_id, company_id, created_by)
	SELECT <cfqueryparam value="#insert_customer.customer_id#" cfsqltype="cf_sql_integer" />, company_id, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
	FROM REF_Company
	WHERE company_id IN (<cfqueryparam value="#attributes.company_id#" cfsqltype="cf_sql_integer" list="true" />)
	</cfquery>
</cftransaction>
</cfsilent>

<cflocation url="index.cfm?fuseaction=Customers.customers" addtoken="no">