
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
		<td><input type="input" name="root_code" value="#root_code#" size="4" maxlength="4"></td>
		<td colspan="2"><input type="input" name="description" value="#description#" size="50"></td>
		<td><cfselect name="company_id" size="1" query="get_companies" value="company_id" display="description" selected="#company_id#"></cfselect></td>
		<td>
			<select name="active_ind" size="1">
				<option value="1"<cfif active_ind EQ 1> SELECTED</cfif>>Active</option>
				<option value="0"<cfif active_ind EQ 0> SELECTED</cfif>>Inactive</option>
			</select>
		</td>
	</tr>
</cfoutput>

