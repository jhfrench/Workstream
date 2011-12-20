<!--Customers/act_add_customer.cfm
	Author: Jeromy F  -->
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
	<cfif len(attributes.lname)>
		<cfquery name="insert_customer_contact" datasource="#application.datasources.main#">
		INSERT INTO Emp_Contact (name, lname, emp_contact_type)
		VALUES ('#attributes.name#', '#attributes.lname#', 4)
		</cfquery>
		<cfif len(attributes.phone)>
			<cfquery name="insert_contact_phone" datasource="#application.datasources.main#">
			INSERT INTO Phone (phone_number, emp_id, phone_type_id)
			VALUES ('#attributes.phone#', IDENT_CURRENT('Emp_Contact'), 1)
			</cfquery>
		</cfif>
		<cfif len(attributes.email)>
			<cfquery name="insert_contact_email" datasource="#application.datasources.main#">
			INSERT INTO Email (email, emp_id, email_type_id)
			VALUES ('#attributes.email#', IDENT_CURRENT('Emp_Contact'), 1)
			</cfquery>
		</cfif>
	</cfif>
	<cfquery name="insert_customer" datasource="#application.datasources.main#">
	INSERT INTO Customer (root_code, description, billable_type_id,
		company_id<cfif len(attributes.company_address1)>, company_address1</cfif><cfif len(attributes.company_address2)>, company_address2</cfif><cfif len(attributes.company_city)>, company_city</cfif>, company_state<cfif len(attributes.company_zip)>, company_zip</cfif><cfif len(attributes.lname)>, emp_contact_id</cfif>, active_ind)
	VALUES ('#variables.new_code#', '#attributes.description#', #attributes.billable_type_id#,
		#attributes.company_id# <cfif len(attributes.company_address1)>, '#attributes.company_address1#'</cfif><cfif len(attributes.company_address2)>, '#attributes.company_address2#'</cfif><cfif len(attributes.company_city)>, '#attributes.company_city#'</cfif>, '#attributes.company_state#'<cfif len(attributes.company_zip)>, '#attributes.company_zip#'</cfif><cfif len(attributes.lname)>, IDENT_CURRENT('Emp_Contact')</cfif>, 1)
	</cfquery>
	<cfquery name="company_id" datasource="#application.datasources.main#">
	INSERT INTO Link_Customer_Company (customer_id, code, company_id)
	SELECT IDENT_CURRENT('Customer'), '#variables.new_code#', company_id
	FROM REF_Company
	WHERE company_id IN (<cfif isdefined("attributes.company_id")>#attributes.company_id#<cfelse>#attributes.company_id#</cfif>)
	</cfquery>
</cftransaction>
</cfsilent>