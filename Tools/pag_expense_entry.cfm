
<!--Tools/pag_expense_entry.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the expense form.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfmodule template="../common_files/act_set_all_option.cfm" business_function_id="710">
<cfmodule template="../common_files/act_calendar.cfm" form_name="expense_insert">
<cfparam name="attributes.emp_id" default="#session.user_account_id#">
<cfinclude template="qry_get_subordinates_expense_register.cfm">
<cfif variables.all_option EQ 1>
	<cfinclude template="qry_get_accounting_expense_register.cfm">
</cfif>
<cfinclude template="qry_get_name.cfm">
<cfinclude template="qry_get_expense_register.cfm">
<cfinclude template="qry_get_expense_category.cfm">
<cfinclude template="qry_get_paid_by.cfm">
<cfinclude template="qry_get_expense_status.cfm">
<cfif isdefined("attributes.expense_id")>
	<cfinclude template="qry_get_expense_details.cfm">
</cfif>

<cfset variables.supervisor_flag = 0>
<cfinclude template="../common_files/qry_project_code.cfm">

<table border="0" cellpadding="4" cellspacing="0" width="100%">
	<tr>
		<td colspan="6">Expenses awaiting accounting approval</td>
	</tr>
	<cfinclude template="expense_header.cfm">
	<cfif get_accounting_expense_register.recordcount>
		<cfoutput query="get_accounting_expense_register">
			<cfinclude template="dsp_expense_details.cfm">
		</cfoutput>
	<cfelse>
		<tr>
			<td colspan="6" align="center">There are no expenses awaiting accounting approval for the criteria selected.</td>
		</tr>
	</cfif>
	<tr>
		<td colspan="6">Expenses for your subordinates</td>
	</tr>
	<cfinclude template="expense_header.cfm">
	<cfif get_subordinates_expense_register.recordcount>
		<cfset variables.supervisor_flag = 1>
		<cfoutput query="get_subordinates_expense_register">
			<cfinclude template="dsp_expense_details.cfm">
		</cfoutput>
		<cfset variables.supervisor_flag = 0>
	<cfelse>
		<tr>
			<td colspan="6" align="center">Your subordinates have no expenses awaiting your approval.</td>
		</tr>
	</cfif>
	<tr>
		<td colspan="6"><cfoutput query="get_name">Expenses for #UCase(name)# #UCase(lname)#</cfoutput></td>
	</tr>
	<cfinclude template="expense_header.cfm">
	<cfif get_expense_register.recordcount>
		<cfoutput query="get_expense_register">
			<cfinclude template="dsp_expense_details.cfm">
		</cfoutput>
	<cfelse>
		<tr>
			<td colspan="6" align="center">You have no expense records that match your criteria.</td>
		</tr>
	</cfif>
	<cfform action="index.cfm?fuseaction=Tools.expense_entry" method="post" name="date_range"> 
	<tr>

		<td colspan="6" align="center">
			Specify: <br />Date Range: <input type="date" name="begin_date" id="begin_date" min="2011-09-01" max="#dateformat(now()+30, 'yyyy-mm-dd')#" maxlength="10" class="span6 date" /> to <input type="date" name="end_date" id="end_date" min="2011-09-01" max="#dateformat(now()+30, 'yyyy-mm-dd')#" maxlength="10" class="span6 date" /><br />
Status: <cfselect name="expense_status_id" size="1" query="get_expense_status" value="expense_status_id" display="description"></cfselect>
<br />
<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
		</td>

	</tr>
	<tr>
		<td colspan="6"><HR></td>
	</tr>
</table>


<table border="0" cellpadding="4" cellspacing="0" width="100%">
<tr>
	<td colspan="5">Expense Detail</td>
</tr>
<tr>
	<td colspan="5"><input type="submit" name="New" value="New"></td>
</tr>
	</cfform>
	<cfform action="index.cfm?fuseaction=Tools.expense_insert" method="post" name="expense_insert"> 
	<cfinclude template="dsp_expense_entry_form.cfm">
	</cfform>
</table>
