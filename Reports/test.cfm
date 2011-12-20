<FORM name="f" ACTION="index.cfm?fuseaction=expense_insert" METHOD=POST onSubmit="return _CF_checkf(this)"> 
	
	
	<table cellspacing="0" cellpadding="4" border="0" width="95%" align="center">
	  <tr>
      	 <td valign="top"class="RegTextMd">Type of Expense: </td>
	       <td colspan="3"> 
			<SELECT name="Reimbursement_Type" SIZE="4" class="RegTextMd">
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
			<input TYPE="Text" name="DateField1" onclick="ShowDate(1)" SIZE="10">
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
   						<input TYPE="Text" name="ExpenseType_1" class="RegTextMd">
   					</td>
   				</tr>
   		   		<tr>
   					<td align="justify" class="RegTextMd">
   						Office Supplies:
   					</td>
   					<td>
   						<input TYPE="Text" name="ExpenseType_2" class="RegTextMd">
   					</td>
   				</tr>
   		   		<tr>
   					<td align="justify" class="RegTextMd">
   						Rental Car:
		   			</td>
   					<td>
   						<input TYPE="Text" name="ExpenseType_3" class="RegTextMd">
		   			</td>
   				</tr>
				<tr>
   					<td align="justify" class="RegTextMd">
		   				Own Car Mileage:
   					</td>
		   			<td>
   						<input TYPE="Text" name="ExpenseType_4" class="RegTextMd">
		   			</td>
   				</tr>
   		  		<tr>
   					<td align="justify" class="RegTextMd">
   						Parking/Toll:
	   				</td>
   					<td>
   						<input TYPE="Text" name="ExpenseType_5" class="RegTextMd">
   					</td>
   				</tr>
   		   		<tr>
   					<td align="justify" class="RegTextMd">
   						Taxi/Bus:
		   			</td>
   					<td>
   						<input TYPE="Text" name="ExpenseType_6" class="RegTextMd">
		   			</td>
   				</tr>
   		   		<tr>
   					<td align="justify" class="RegTextMd">
   						Lodging:
   					</td>
   					<td>
		   				<input TYPE="Text" name="ExpenseType_7" class="RegTextMd">
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
   						<input TYPE="Text" name="ExpenseType_8" class="RegText<cfoutput>Md</cfoutput>">
		   			</td>
   				</tr>
				
   				<tr>
   					<td align="justify" class="RegTextMd">
		   				Lunch:
   					</td>
		   			<td>
   						<input TYPE="Text" name="ExpenseType_9" class="RegText<cfoutput>Md</cfoutput>">
		   			</td>
   				</tr>
			
   				<tr>
		   			<td align="justify" class="RegTextMd">
   						Dinner:
		   			</td>
   					<td>
   						<input TYPE="Text" name="ExpenseType_10" class="RegText<cfoutput>Md</cfoutput>">
		   			</td>
   				</tr>
			
		   		<tr>
   					<td align="justify" class="RegTextMd">
   						Phone:
		   			</td>
   					<td>
   						<input TYPE="Text" name="ExpenseType_11" class="RegText<cfoutput>Md</cfoutput>">
		   			</td>
   				</tr>
			
   				<tr>
		   			<td align="justify" class="RegTextMd">
   						Tips:	
		   			</td>
   					<td>
   						<input TYPE="Text" name="ExpenseType_12" class="RegText<cfoutput>Md</cfoutput>">
		   			</td>
   				</tr>
			
		   		<tr>
   					<td align="justify" class="RegTextMd">
		   				Misc:
   					</td>
		   			<td>
   						<input TYPE="Text" name="ExpenseType_13" class="RegText<cfoutput>Md</cfoutput>">
		   			</td>
   				</tr>
			
		   		<tr>
   					<td align="justify" class="RegTextMd">
   						Conference:
		   			</td>
		   			<td>
   						<input TYPE="Text" name="ExpenseType_14" class="RegText<cfoutput>Md</cfoutput>">
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
		<textarea cols="60" rows="4" name="Notes" wrap="auto"class="RegText">
			Type your notes here.
		</textarea>
	</td>
   </tr>
   <input type="hidden" name="emp_id" value="41">
   <tr>
   	<td align="right">
		<input type="submit" value="Submit" name="Insert">
		<input type="Reset">
	</td>
   </tr>
</table>
</table>
	</FORM>
