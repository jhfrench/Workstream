
<!--Tools/dsp_expense_type.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the choices for the select box for expense types.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->

</cfsilent>
   <tr>
       <td valign="top"class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">Type of Expense: </td>
       <td colspan="3"><cfselect name="Reimbursement_Type_id"
          size="#Get_Reimbursement.recordcount#"
          message="Select a Type of Expense"
          required="Yes" class="RegText#session.workstream_text_size#">
       <cfoutput query="Get_Reimbursement" >
       <option value="#Get_Reimbursement.Reimbursement_ID#" <cfif isdefined("get_expense_values.Reimbursement_Type_id") and not compare(get_expense_values.Reimbursement_Type_id, Get_Reimbursement.Reimbursement_ID) >Selected</cfif>>
       #Get_Reimbursement.Reimbursement_Type#
       </option>
       </cfoutput>
      </cfselect> </td>
   </tr>
   