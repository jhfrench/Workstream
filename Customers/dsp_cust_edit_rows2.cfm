
<!--Customers/dsp_cust_edit_rows2.cfm
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
		<td><input type="text" name="company_address1" value="#company_address1#" class="RegText#session.workstream_text_size#"></td>
		<td><input type="text" name="company_address2" value="#company_address2#" class="RegText#session.workstream_text_size#"></td>
		<td><input type="text" name="Company_city" value="#Company_city#" class="RegText#session.workstream_text_size#"></td>
		<td><cfselect name="Company_State" size="1" query="get_states" value="state" display="state" selected="#Company_State#" class="RegText#session.workstream_text_size#"></cfselect></td>
		<td><input type="text" name="Company_zip" value="#Company_zip#" size="10" class="RegText#session.workstream_text_size#"></td>
	</tr>
</cfoutput>