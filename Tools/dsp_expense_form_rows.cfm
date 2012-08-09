
<!--Tools/dsp_expense_form_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the  rows for the expense form.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

</cfsilent>
	<tr>
		<td>Code:</td>
		<td>
			<select name="project_id" size="1"class="RegText">
			<cfoutput query="project">
			<option  value="#project.project_id#"<cfif isdefined("get_expense_values.project_id") and not compare(get_expense_values.project_id, project.project_id) > selected="selected"</cfif>>#display#</option>
			</cfoutput>
			</select>
		</td>
		<td>Date: </td>
		<td>
			<cfset variables.datefield1="">
			<cfif isdefined("get_expense_values.work_date")>
				<cfset variables.datefield1=dateformat(get_expense_values.work_date,"mm/dd/yyyy")>
			</cfif>
			<input type="date" name="DateField1" id="from_date" min="2011-09-01" max="#dateformat(now()+30, 'yyyy-mm-dd')#" value="#dateformat(variables.datefield1, 'yyyy-mm-dd')#"  maxlength="10" required="required" class="span6 date" />
			<!-- Use CF to create validation <cfinput type="datefield" name="DateField1" message="Enter a date." validate="date" required="yes" size="12"> -->
		</td>
</tr>
<tr>
   		<td colspan="2" valign="top">

   	<table cellpadding="2" cellspacing="0" border="0">
   		<cfloop from="#start#" to="#num_expense#" index="ii">
   		<tr>
   			<td align="justify">
   				<cfoutput>#Get_Expense_Type.Expense_Type[ii]#</cfoutput>:
   			</td>
   			<td>
   				<cfinput type="text" name="et_#ii#" validate="float" message="Please enter an amount in the #Get_Expense_Type.Expense_Type[ii]#  field." value="#evaluate('expense_cross_tab.et_#ii#')#">
   			</td>
   		</tr>
   		<cfset start=IncrementValue(start)>
		</cfloop>
   	</table>
   </td>
   <td colspan="2" valign="top">

   	<table cellpadding="2" cellspacing="2" border="0">
   			<cfloop from="#start#" to="#end_row#" index="ii">
   		<tr>
   			<td align="justify">
   				<cfoutput>#Get_Expense_Type.Expense_Type[ii]#</cfoutput>:
   			</td>
   			<td>
   				<cfinput type="text" name="et_#ii#" validate="float" message="Please enter an amount in the #Get_Expense_Type.Expense_Type[ii]# field." value="#evaluate('expense_cross_tab.et_#ii#')#">
   			</td>
   		</tr>
			</cfloop>
   	</table>
		</td>
	</tr>
	<tr>
		<td valign="top">Notes:</td>
		<td colspan="3"><textarea cols="60" rows="4" name="Note" wrap="auto"><cfif isdefined("get_expense_values.note")><cfoutput>#get_expense_values.note#</cfoutput><cfelse>Type your notes here.</cfif></textarea></td>
	</tr>
	<tr>
		<td align="right">
			<cfoutput>
			<input type="hidden" name="expense_id" value="#attributes.expense_id#" />
			<input type="hidden" name="emp_id" value="#session.user_account_id#" />
			</cfoutput>
			<input type="submit" name="Insert" value="Submit" class="btn btn-primary" />
			<input type="reset" class="btn" />
		</td>
	</tr>
</table>
   