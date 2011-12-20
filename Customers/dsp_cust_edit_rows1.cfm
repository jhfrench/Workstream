
<!--Customers/dsp_cust_edit_rows1.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->


<cfoutput query="customer_change"> 
	<tr>
		<td><input type="input" name="root_code" value="#root_code#" size="4" maxlength="4" class="RegText"></td>
		<td colspan="2"><input type="input" name="description" value="#description#" size="50" class="RegText"></td>
		<td><cfselect name="company_id" size="1" query="get_companies" value="company_id" display="description" selected="#company_id#" class="RegText"></cfselect></td>
		<td><select name="active_ind" size="1" class="RegText">
			<option value="1" <cfif Active_Id EQ 1> SELECTED</cfif> class="RegText">Active</option>
			<option value="0"<cfif Active_Id EQ 0> SELECTED</cfif> class="RegText">Inactive</option>
</select>
		</td>
	</tr>
</cfoutput>

