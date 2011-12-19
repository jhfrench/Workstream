
<!--Tools/dsp_expense_form_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the  rows for the expense form.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 21:01:06  daugherty
Initial revision

Revision 1.1  2001-10-11 10:54:25-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	Took pop-up calendar code and put it in common_files.
	||
	END FUSEDOC --->

</cfsilent>
	<tr>
     	<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		Code:
	</td>
	<td>
	<select name="project_id" size="1"class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
<cfoutput query="project">
	<option  value="#project.project_id#"<cfif isdefined("get_expense_values.project_id") and not compare(get_expense_values.project_id, project.project_id) >Selected</cfif>>#display#</option>
</cfoutput>
</select>
	</td>
	  <td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">Date: </td>
       <td>
	  <cfif isdefined("get_expense_values.work_date")>  <cfinput type="datefield" name="DateField1" message="Enter a date." validate="date" required="Yes" size="12" class="RegText#session.workstream_text_size#" value="#DateFormat(get_expense_values.work_date,'mm/dd/yyyy')#"><cfelse>
	  <cfinput type="datefield" name="DateField1" message="Enter a date." validate="date" required="Yes" size="12" class="RegText#session.workstream_text_size#">
</cfif>
		<cfinclude template="../common_files/dsp_pop_calendar.cfm">
     	</td>
</tr>
<tr>
   		<td colspan="2" valign="top">
	
   	<table cellpadding="2" cellspacing="0" border="0">
   			<cfloop from="#start#" to="#num_expense#" index="ii">
   		<tr>
   			<td align="justify" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
   				<cfoutput>#Get_Expense_Type.Expense_Type[ii]#</cfoutput>:
   			</td>
   			<td>
   				<cfinput type="Text" name="et_#ii#" validate="float" message="Please enter an amount in the #Get_Expense_Type.Expense_Type[ii]#  field." class="RegText#session.workstream_text_size#" value="#evaluate('expense_cross_tab.et_#ii#')#">
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
   			<td align="justify" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
   				<cfoutput>#Get_Expense_Type.Expense_Type[ii]#</cfoutput>:
   			</td>
   			<td>
   				<cfinput type="Text" name="et_#ii#" validate="float" message="Please enter an amount in the #Get_Expense_Type.Expense_Type[ii]# field." class="RegText#session.workstream_text_size#" value="#evaluate('expense_cross_tab.et_#ii#')#">
   			</td>
   		</tr>
			</cfloop>
   	</table>
		</td>
	</tr>
	<tr>
		<td valign="top" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">Notes:</td>
		<td colspan="3" class="RegText<cfoutput>#session.workstream_text_size#"><textarea cols="60" rows="4" name="Note" wrap="auto" class="RegText#session.workstream_text_size#</cfoutput>"><cfif isdefined("get_expense_values.note")><cfoutput>#get_expense_values.note#</cfoutput><cfelse>Type your notes here.</cfif></textarea></td>
	</tr>
	<input type="hidden" name="emp_id" value="<cfoutput>#session.user_account_id#</cfoutput>">
	<tr>
		<td align="right">
			<input type="Submit" value="Submit" name="Insert" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<input type="Reset" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
	</tr>
</table>
   