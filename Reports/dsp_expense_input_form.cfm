
<!--Reports/dsp_expense_input_form.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the form that tells to expense report all the necessary information.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfmodule template="dsp_from_through_date_NO_Form.cfm" report_name="Expense Report" form_name="expense" required_ind="0">
<table border="0" cellpadding="3" cellspacing="0" align="center" width="25%"> 
	<tr>
		<td>Report By Code</td>
	</tr>
	<tr>
		<td><cfinclude template="dsp_code_report_input.cfm"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"class="SubHeadText">OR</td>
	</tr>
	<tr>
		<td >Report By Person</td>
	</tr>
	<tr>
		<td align="center"><cfmodule template="../common_files/dsp_team_select.cfm" onchange="" user_account_id="" multi="1"></td>
	</tr>
	<tr>
		<td colspan="1"><input type="submit" name="Submit" value="Submit"></td>
	</tr>
</table>
