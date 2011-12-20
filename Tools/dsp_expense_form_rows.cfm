
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
     	<td class="RegText">
		Code:
	</td>
	<td>
	<select name="project_id" size="1"class="RegText">
<cfoutput query="project">
	<option  value="#project.project_id#"<cfif isdefined("get_expense_values.project_id") and not compare(get_expense_values.project_id, project.project_id) >Selected</cfif>>#display#</option>
</cfoutput>
</select>
	</td>
	  <td class="RegText">Date: </td>
       <td>
	  <cfif isdefined("get_expense_values.work_date")>  <cfinput type="datefield" name="DateField1" message="Enter a date." validate="date" required="Yes" size="12" class="RegText" value="#dateformat(get_expense_values.work_date,'mm/dd/yyyy')#"><cfelse>
	  <cfinput type="datefield" name="DateField1" message="Enter a date." validate="date" required="Yes" size="12" class="RegText">
</cfif>
		<cfinclude template="../common_files/dsp_pop_calendar.cfm">
     	</td>
</tr>
<tr>
   		<td colspan="2" valign="top">
	
   	<table cellpadding="2" cellspacing="0" border="0">
   			<cfloop from="#start#" to="#num_expense#" index="ii">
   		<tr>
   			<td align="justify" class="RegText">
   				<cfoutput>#Get_Expense_Type.Expense_Type[ii]#</cfoutput>:
   			</td>
   			<td>
   				<cfinput type="Text" name="et_#ii#" validate="float" message="Please enter an amount in the #Get_Expense_Type.Expense_Type[ii]#  field." class="RegText" value="#evaluate('expense_cross_tab.et_#ii#')#">
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
   			<td align="justify" class="RegText">
   				<cfoutput>#Get_Expense_Type.Expense_Type[ii]#</cfoutput>:
   			</td>
   			<td>
   				<cfinput type="Text" name="et_#ii#" validate="float" message="Please enter an amount in the #Get_Expense_Type.Expense_Type[ii]# field." class="RegText" value="#evaluate('expense_cross_tab.et_#ii#')#">
   			</td>
   		</tr>
			</cfloop>
   	</table>
		</td>
	</tr>
	<tr>
		<td valign="top" class="RegText">Notes:</td>
		<td colspan="3" class="RegText<cfoutput>#session.workstream_text_size#"><textarea cols="60" rows="4" name="Note" wrap="auto" class="RegText</cfoutput>"><cfif isdefined("get_expense_values.note")><cfoutput>#get_expense_values.note#</cfoutput><cfelse>Type your notes here.</cfif></textarea></td>
	</tr>
	<input type="hidden" name="emp_id" value="<cfoutput>#session.user_account_id#</cfoutput>">
	<tr>
		<td align="right">
			<input type="submit" value="Submit" name="Insert" class="RegText">
			<input type="Reset" class="RegText">
		</td>
	</tr>
</table>
   