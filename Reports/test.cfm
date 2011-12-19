<FORM NAME="f" ACTION="index.cfm?fuseaction=expense_insert" METHOD=POST onSubmit="return _CF_checkf(this)"> 
	
	
	<table cellspacing="0" cellpadding="4" border="0" width="95%" align="center">
	  <tr>
      	 <td valign="top"class="RegTextMd">Type of Expense: </td>
	       <td colspan="3"> 
			<SELECT NAME="Reimbursement_Type" SIZE="4" CLASS="RegTextMd">
		       <option value="1" selected>
	      		 Out Of Pocket Expense
	      	 </option>
       
      		 <option value="2" selected>
			       Non-Billable Expense
		       </option>
       
      		 <option value="3" selected>
			       Expense Paid by LewisCo Inc
		       </option>
       
		       <option value="4" selected>
			       Expense Paid by Nucleus 
		       </option>
       
		      </SELECT> 
		</td>
   	</tr>
   	

	<tr>
     		<td class="RegTextMd">
			Code:
		</td>
		<td>
			<select name="project_id" size="1"class="RegTextMd">
				<option  value="592" >8570 - Gen Admin</option>
			</select>
		</td>
	  	<td class="RegTextMd">
			Date: 
		</td>
       	<td>
			<INPUT TYPE="Text" NAME="DateField1" ONCLICK="ShowDate(1)" SIZE="10">
           </td>
	</tr>
	<tr>
   		<td colspan="2" valign="top">
   			<table cellpadding="2" cellspacing="0" border="0">
   				<tr>
   					<td align="justify" class="RegTextMd">
   						Airfare:
   					</td>
   					<td>
   						<INPUT TYPE="Text" NAME="ExpenseType_1" CLASS="RegTextMd">
   					</td>
   				</tr>
   		   		<tr>
   					<td align="justify" class="RegTextMd">
   						Office Supplies:
   					</td>
   					<td>
   						<INPUT TYPE="Text" NAME="ExpenseType_2" CLASS="RegTextMd">
   					</td>
   				</tr>
   		   		<tr>
   					<td align="justify" class="RegTextMd">
   						Rental Car:
		   			</td>
   					<td>
   						<INPUT TYPE="Text" NAME="ExpenseType_3" CLASS="RegTextMd">
		   			</td>
   				</tr>
				<tr>
   					<td align="justify" class="RegTextMd">
		   				Own Car Mileage:
   					</td>
		   			<td>
   						<INPUT TYPE="Text" NAME="ExpenseType_4" CLASS="RegTextMd">
		   			</td>
   				</tr>
   		  		<tr>
   					<td align="justify" class="RegTextMd">
   						Parking/Toll:
	   				</td>
   					<td>
   						<INPUT TYPE="Text" NAME="ExpenseType_5" CLASS="RegTextMd">
   					</td>
   				</tr>
   		   		<tr>
   					<td align="justify" class="RegTextMd">
   						Taxi/Bus:
		   			</td>
   					<td>
   						<INPUT TYPE="Text" NAME="ExpenseType_6" CLASS="RegTextMd">
		   			</td>
   				</tr>
   		   		<tr>
   					<td align="justify" class="RegTextMd">
   						Lodging:
   					</td>
   					<td>
		   				<INPUT TYPE="Text" NAME="ExpenseType_7" CLASS="RegTextMd">
   					</td>
		   		</tr>				
   			</table>
   		</td>
  		 <td colspan="2" valign="top">
   			<table cellpadding="2" cellspacing="2" border="0">
   				<tr>
		   			<td align="justify" class="RegTextMd">
   						Breakfast:
		   			</td>
   					<td>
   						<INPUT TYPE="Text" NAME="ExpenseType_8" CLASS="RegText<cfoutput>Md</cfoutput>">
		   			</td>
   				</tr>
				
   				<tr>
   					<td align="justify" class="RegTextMd">
		   				Lunch:
   					</td>
		   			<td>
   						<INPUT TYPE="Text" NAME="ExpenseType_9" CLASS="RegText<cfoutput>Md</cfoutput>">
		   			</td>
   				</tr>
			
   				<tr>
		   			<td align="justify" class="RegTextMd">
   						Dinner:
		   			</td>
   					<td>
   						<INPUT TYPE="Text" NAME="ExpenseType_10" CLASS="RegText<cfoutput>Md</cfoutput>">
		   			</td>
   				</tr>
			
		   		<tr>
   					<td align="justify" class="RegTextMd">
   						Phone:
		   			</td>
   					<td>
   						<INPUT TYPE="Text" NAME="ExpenseType_11" CLASS="RegText<cfoutput>Md</cfoutput>">
		   			</td>
   				</tr>
			
   				<tr>
		   			<td align="justify" class="RegTextMd">
   						Tips:	
		   			</td>
   					<td>
   						<INPUT TYPE="Text" NAME="ExpenseType_12" CLASS="RegText<cfoutput>Md</cfoutput>">
		   			</td>
   				</tr>
			
		   		<tr>
   					<td align="justify" class="RegTextMd">
		   				Misc:
   					</td>
		   			<td>
   						<INPUT TYPE="Text" NAME="ExpenseType_13" CLASS="RegText<cfoutput>Md</cfoutput>">
		   			</td>
   				</tr>
			
		   		<tr>
   					<td align="justify" class="RegTextMd">
   						Conference:
		   			</td>
		   			<td>
   						<INPUT TYPE="Text" NAME="ExpenseType_14" CLASS="RegText<cfoutput>Md</cfoutput>">
		   			</td>
   				</tr>
			
		   	</table>
   		</td>
	</tr>
   	<tr>
       <td valign="top" class="RegTextMd">
		Notes:
	</td>
       <td colspan="3"class="RegTextMd">
		<textarea cols="60" rows="4" name="Notes" wrap="auto"class="RegText#session.workstream_text_size#">
			Type your notes here.
		</textarea>
	</td>
   </tr>
   <input type="hidden" name="emp_id" value="41">
   <tr>
   	<td align="right">
		<input type="Submit" value="Submit" name="Insert">
		<input type="Reset">
	</td>
   </tr>
</table>
</table>
	</FORM>
