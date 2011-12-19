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
		SELECT MAX(emp_id) as emp_id
		From Emp_contact
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
		company_id<cfif Compare(attributes.company_address1, "")>, company_address1</cfif><cfif Compare(attributes.company_address2, "")>, company_address2</cfif><cfif Compare(attributes.company_city, "")>, company_city</cfif>, company_state<cfif Compare(attributes.company_zip, "")>, company_zip</cfif><cfif compare(attributes.lname, "")>, emp_contact_id</cfif>, active_id)
	VALUES ('#new_code#', '#attributes.description#', #attributes.billable_id#,
		#attributes.company_id# <cfif Compare(attributes.company_address1, "")>, '#attributes.company_address1#'</cfif><cfif Compare(attributes.company_address2, "")>, '#attributes.company_address2#'</cfif><cfif Compare(attributes.company_city, "")>, '#attributes.company_city#'</cfif>, '#attributes.company_state#'<cfif Compare(attributes.company_zip, "")>, '#attributes.company_zip#'</cfif><cfif compare(attributes.lname, "")>, #Get_new_emp_id.emp_id#</cfif>, 2)
	</cfquery>
	<cfif isdefined("Visible_to")>
		<cfloop index="ii" list="#visible_to#">
			<cfquery name="visible_to" datasource="#application.datasources.main#">
			INSERT INTO customer_visible_to (Code, visible_to)
			VALUES ('#new_code#', '#ii#')
			</cfquery>
		</cfloop>
	<cfelse>
		<cfquery name="visible_to" datasource="#application.datasources.main#">
		INSERT INTO customer_visible_to (Code, visible_to)	
		VALUES ('#new_code#', '#Company_id#')
		</cfquery>
	</cfif> 
<!--- <cfabort> --->
</cftransaction>
</cfsilent>


