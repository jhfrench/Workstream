<!--Tools/dsp_expense_entry_form.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the expense detail display and entry form
	||
	Name: Jeromy French
	||
	Edits:


	 
	 || 
	END FUSEDOC --->
<cfparam name="attributes.amount" default="">
<cfparam name="attributes.client_billable_ind" default="">
<cfparam name="attributes.date_incurred" default="">
<cfparam name="attributes.expense_category_id" default="">
<cfparam name="attributes.expense_note" default="">
<cfparam name="attributes.paid_by_id" default="">
<cfparam name="attributes.payee_name" default="">
<cfparam name="attributes.project_id" default="">
</cfsilent>

<cfif isdefined("attributes.expense_id") AND get_expense_details.recordcount>
	<cfset attributes.amount=get_expense_details.amount>
	<cfset attributes.client_billable_ind=get_expense_details.client_billable_ind>
	<cfset attributes.date_incurred=get_expense_details.date_incurred>
	<cfset attributes.expense_category_id=get_expense_details.expense_category_id>
	<cfset attributes.expense_note=get_expense_details.expense_note>
	<cfset attributes.paid_by_id=get_expense_details.paid_by_id>
	<cfset attributes.payee_name=get_expense_details.payee_name>
	<cfset attributes.project_id=get_expense_details.project_id><!--- 
	<cfset attributes.supervisor_flag=url.supervisor_flag> --->
	<cfset attributes.expense_status_id=get_expense_details.expense_status_id>
	<cfset attributes.accounting_approval_memo=get_expense_details.accounting_approval_memo>
	<cfset attributes.supervisor_approval_memo=get_expense_details.supervisor_approval_memo>
</cfif>



<cfinclude template="../common_files/qry_get_valid_projects.cfm">



<tr>
	<td>Employee</td>
	<td>
		<cfset attributes.class="RegText">
		<cfinclude template="../common_files/dsp_team_select.cfm">
	</td>
	<td>
		&nbsp;
	</td>
	<td>
		Date
	</td>
	<td>
		<cfinput type="datefield" name="date_incurred" value="#dateformat(attributes.date_incurred,'mm/dd/yyyy')#" required="Yes" validate="date" message="Please enter the date this expense was paid (mm/dd/yyyy format)." size="11">
	</td>
</tr>
<tr>
	<td>Payee</td>
	<td>
		<cfinput type="text" name="payee_name" value="#attributes.payee_name#" required="Yes"  size="40" message="Please enter a payee name." >
	</td>
	<td>
		&nbsp;
	</td>
	<td>
		Amount
	</td>
	<td>
		$<cfinput type="text" name="amount" value="#right(dollarformat(attributes.amount),len(dollarformat(attributes.amount))-1)#" required="Yes" size="8" message="Please enter an expense amount." align="right">
	</td>
</tr>
<tr>
	<td>Category</td>
	<td>
		<cfselect query="get_expense_category" message="Please select an expense catagory" name="expense_category_id" size="2" required="Yes" selected="#attributes.expense_category_id#" display="description" value="expense_category_id" onchange="javascript: (document.forms[1].expense_category_id.options[document.forms[1].expense_category_id.selectedIndex].text=='--OTHER'?document.all.category.style.visibility='visible':document.all.category.style.visibility='hidden'); (document.forms[1].expense_category_id.options[document.forms[1].expense_category_id.selectedIndex].text=='--OTHER'?document.all.optional_new_category_div.style.visibility='visible':document.all.optional_new_category_div.style.visibility='hidden');"></cfselect>
	</td>
	<td align="left">
		<div id="category" style="visibility='hidden'">New Category</div>&nbsp;
	</td>
	<td colspan="2">
		<div id="optional_new_category_div" style="visibility='hidden'"><cfinput type="text" name="optional_new_category" value="" required="No"  size="30"></div>&nbsp;
	</td>
</tr>
<tr>
	<td>Client Code</td>
	<td class="SubHeadText" valign="top">
		<cfselect name="project_id" size="2" required="yes" message="Please select a project">
					<cfoutput query="get_valid_projects">
						<option value="#project_id#"<cfif attributes.project_id EQ get_valid_projects.project_id>selected</cfif>>
						<cfif session.workstream_project_list_order EQ 1>
							#customer# #replace(project_name,customer,"","ALL")# (#project_code#)
						<cfelse>
							#project_code# - #customer# #replace(project_name,customer,"","ALL")#
						</cfif>
						</option>
					</cfoutput>
				</cfselect>
	</td>
	<td>
		&nbsp;
	</td>
	<td colspan="2">
	<cfif attributes.client_billable_ind EQ 1>
		<cfset variables.checked_ind_yes="YES">
		<cfset variables.checked_ind_no="NO">
	<cfelseif attributes.client_billable_ind EQ 0>
		<cfset variables.checked_ind_yes="NO">
		<cfset variables.checked_ind_no="YES">
	<cfelse>
		<cfset variables.checked_ind_yes="NO">
		<cfset variables.checked_ind_no="NO">
	</cfif>

		Billable to Client? <label for="client_billable_ind_yes"><cfinput type="radio" name="client_billable_ind" id="client_billable_ind_yes" value="1" required="Yes" checked="#variables.checked_ind_yes#" message="Please select whether or not the client is billable for this expense."> Yes</label>
&nbsp;&nbsp;

<label for="client_billable_ind_no"><cfinput type="radio" name="client_billable_ind" id="client_billable_ind_no" value="0" checked="#variables.checked_ind_no#"> No</label>
	</td>
</tr>
<tr>
	<td>Expense Note</td>
	<td colspan="4">
		<cfinput type="text" name="expense_note" value="#attributes.expense_note#" required="Yes" message="Please enter an expense note." size="100">
	</td>
</tr>
<tr>
	<td>Paid By:</td>
	<td colspan="4">
		<cfset variables.currentrow=1>
		<cfset variables.required_ind="YES">
		<cfoutput query="get_paid_by">
			<cfset variables.selected_value="">
			<cfif attributes.paid_by_id EQ get_paid_by.paid_by_id>
				<cfset variables.selected_value="YES">
			<cfelse>
				<cfset variables.selected_value="NO">
			</cfif>
			<cfif variables.currentrow NEQ 1>
				<cfset variables.required_ind="NO">
			</cfif>

			<label for="#get_paid_by.description#">
				<cfinput type="Radio" id="#get_paid_by.description#" name="paid_by_id" value="#get_paid_by.paid_by_id#" checked="#variables.selected_value#" required="#variables.required_ind#" message="Please specify who paid for this expense (paid by)."> #get_paid_by.description#
			</label>
		</cfoutput>
		<cfoutput><input type="hidden" name="expense_id" value="<cfif isdefined('attributes.expense_id')>#attributes.expense_id#</cfif>"></cfoutput>
	</td>
</tr>
<tr>
	<td colspan="5">
		<cfif isdefined("attributes.supervisor_flag") AND attributes.supervisor_flag>
			<cfif attributes.expense_status_id EQ 2>
				<cfset variables.supervisor_checked_ind_approved="YES">
				<cfset variables.supervisor_checked_ind_rejected="NO">
			<cfelseif attributes.expense_status_id EQ 3>
				<cfset variables.supervisor_checked_ind_approved="NO">
				<cfset variables.supervisor_checked_ind_rejected="YES">
			<cfelse>
				<cfset variables.supervisor_checked_ind_approved="NO">
				<cfset variables.supervisor_checked_ind_rejected="NO">
			</cfif>
				<input type="hidden" name="supervisor_settings" value="1">
				Supervisor, please approve or reject this expense: Approve<cfinput type="Radio" name="supervisor_approval" value="2" checked="#supervisor_checked_ind_approved#" required="Yes" message="Please give this expense a supervisors approval."> Reject<cfinput type="Radio" name="supervisor_approval" value="3" checked="#supervisor_checked_ind_rejected#">&nbsp;&nbsp;&nbsp;Supervisor Approval Memo: <cfinput type="text" name="supervisor_approval_memo" value="#attributes.supervisor_approval_memo#" message="Please enter an approval memo" required="Yes" size="30">
		<br />
		</cfif>
		<cfif variables.all_option EQ 1 AND isdefined("attributes.supervisor_flag") AND NOT attributes.supervisor_flag>
			<cfif attributes.expense_status_id EQ 4>
				<cfset variables.accounting_checked_ind_approved="YES">
				<cfset variables.accounting_checked_ind_rejected="NO">
			<cfelseif attributes.expense_status_id EQ 5>
				<cfset variables.accounting_checked_ind_approved="NO">
				<cfset variables.accounting_checked_ind_rejected="YES">
			<cfelse>
				<cfset variables.accounting_checked_ind_approved="NO">
				<cfset variables.accounting_checked_ind_rejected="NO">
			</cfif>
			<input type="hidden" name="accounting_pro_settings" value="1">
			Accounting professional, please approve or reject this expense: Approve<cfinput type="Radio" name="accounting_approval" value="4" checked="#accounting_checked_ind_approved#" required="Yes" message="Please give this expense an accounting professionals approval."> Reject<cfinput type="Radio" name="accounting_approval" value="5" checked="#accounting_checked_ind_rejected#">&nbsp;&nbsp;&nbsp;Accounting Professional Approval Memo: <cfinput type="text" name="accounting_approval_memo" value="#attributes.accounting_approval_memo#" message="Please enter an approval memo" required="Yes" size="30">
		</cfif>
	</td>
</tr>
<tr>
	<td align="left" colspan="5"><cfif variables.all_option EQ 1><input type="submit" name="Submit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="Reset" value="Reset"></cfif></td>
</tr>
