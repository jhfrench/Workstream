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
	<cfif compare(attributes.lname, "")>
		<cfquery name="insert_customer_contact" datasource="#application.datasources.main#">
		INSERT INTO Emp_Contact (name, lname, emp_contact_type)
		VALUES ('#attributes.name#', '#attributes.lname#', 4)
		</cfquery>
		<cfquery name="get_new_emp_id" datasource="#application.datasources.main#">
		SELECT MAX(emp_id) AS emp_id
		FROM Emp_contact
		</cfquery>
		<cfif compare(attributes.phone, "")>
			<cfquery name="insert_contact_phone" datasource="#application.datasources.main#">
			INSERT INTO phone (phone_number, emp_id, phone_type_id)
			VALUES ('#attributes.phone#', #get_new_emp_id.emp_id#, 1)
			</cfquery>
		</cfif>
		<cfif compare(attributes.email, "")>
			<cfquery name="insert_contact_email" datasource="#application.datasources.main#">
			INSERT INTO email (email, emp_id, email_type_id)
			VALUES ('#attributes.email#', #get_new_emp_id.emp_id#, 1)
			</cfquery>
		</cfif>
	</cfif>
	<cfquery name="insert_Customer" datasource="#application.datasources.main#">
	INSERT INTO Customers (root_code, description, billable_id,
		company_id<cfif len(attributes.company_address1)>, company_address1</cfif><cfif len(attributes.company_address2)>, company_address2</cfif><cfif len(attributes.company_city)>, company_city</cfif>, company_state<cfif len(attributes.company_zip)>, company_zip</cfif><cfif len(attributes.lname)>, emp_contact_id</cfif>, active_ind)
	VALUES ('#new_code#', '#attributes.description#', #attributes.billable_id#,
		#attributes.company_id# <cfif len(attributes.company_address1)>, '#attributes.company_address1#'</cfif><cfif len(attributes.company_address2)>, '#attributes.company_address2#'</cfif><cfif len(attributes.company_city)>, '#attributes.company_city#'</cfif>, '#attributes.company_state#'<cfif len(attributes.company_zip)>, '#attributes.company_zip#'</cfif><cfif len(attributes.lname)>, #Get_new_emp_id.emp_id#</cfif>, 1)
	</cfquery>
	<cfquery name="visible_to" datasource="#application.datasources.main#">
	INSERT INTO Customer_Visible_To (code, visible_to)
	SELECT '#new_code#', company_id
	FROM REF_Companies
	WHERE company_id IN (<cfif isdefined("attributes.visible_to")>#attributes.visible_to#<cfelse>#attributes.company_id#</cfif>)
	</cfquery>
</cftransaction>
</cfsilent>
