
<!--Tools/qry_insert_expense_data.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I insert optional expense data into the database.
	||
	Name: Jeromy French
	||
	Edits:


	 
	 || 
	END FUSEDOC --->

<cfif isdefined("attributes.expense_id") AND len(attributes.expense_id)>

	<cfquery name="update_expense_data" datasource="#application.datasources.main#" >
		UPDATE Expense
		SET
			emp_id = #attributes.emp_id#,
			date_incurred = '#attributes.date_incurred#',
			payee_name = '#attributes.payee_name#',
			amount = #attributes.amount#,
			expense_category_id = #attributes.expense_category_id#,
			project_id = #attributes.project_id#,
			client_billable_ind = #attributes.client_billable_ind#,
			expense_note = '#attributes.expense_note#',
			paid_by_id = #attributes.paid_by_id#
			<cfif isdefined("attributes.supervisor_settings")>
				,expense_status_id = #attributes.supervisor_approval#,
				<cfif attributes.accounting_approval EQ 2>
					date_supervisor_approved = CURRENT_TIMESTAMP,
				</cfif>
				supervisor_approval_emp_id = #session.user_account_id#,
				supervisor_approval_memo = '#attributes.supervisor_approval_memo#',
			</cfif>
			<cfif isdefined("attributes.accounting_pro_settings")>
				,expense_status_id = #attributes.accounting_approval#,
				<cfif attributes.accounting_approval EQ 4>
					date_accounting_approved = CURRENT_TIMESTAMP,
				</cfif>
				accounting_approval_memo = '#attributes.accounting_approval_memo#',
				accounting_approval_emp_id = #session.user_account_id#
			</cfif>
		WHERE expense_id = #attributes.expense_id#
		</cfquery>
<cfelse>
	<cfquery name="insert_expense_data" datasource="#application.datasources.main#" >
	INSERT INTO Expense
		(
		emp_id,
		date_incurred,
		payee_name,
		amount,
		expense_category_id,
		project_id,
		client_billable_ind,
		expense_note,
		paid_by_id
		<cfif isdefined("attributes.supervisor_settings")>
			,supervisor_approval_emp_id,
			supervisor_approval_memo,
			expense_status_id
			<cfif attributes.supervisor_approval EQ 2>,date_supervisor_approved</cfif>
		</cfif>
		<cfif isdefined("attributes.accounting_pro_settings")>
			,accounting_approval_memo,
			expense_status_id,
			accounting_approval_emp_id
			<cfif attributes.accounting_approval EQ 4>,date_accounting_approved</cfif>
		</cfif>
		)
	VALUES
		(
		#attributes.emp_id#,
		'#attributes.date_incurred#',
		'#attributes.payee_name#',
		#attributes.amount#,
		<cfif len(attributes.optional_new_category)>
			#variables.expense_category_id#,
		<cfelse>
			#attributes.expense_category_id#,
		</cfif>
		#attributes.project_id#,
		#attributes.client_billable_ind#,
		'#attributes.expense_note#',
		#attributes.paid_by_id#
		<cfif isdefined("attributes.supervisor_settings")>
			,#session.user_account_id#,
			'#attributes.supervisor_approval_memo#',
			#attributes.supervisor_approval#,
			<cfif attributes.supervisor_approval>CURRENT_TIMESTAMP</cfif>
		</cfif>
		<cfif isdefined("attributes.accounting_pro_settings")>
			,CURRENT_TIMESTAMP,
			'#attributes.accounting_approval_memo#',
			#attributes.accounting_approval#,
			#session.user_account_id#
		</cfif>
		)
		</cfquery>
</cfif>
</cfsilent>