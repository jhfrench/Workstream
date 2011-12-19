
<!--Customers/dsp_new_cust_bill.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
    </cfsilent>
<tr>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Address 1</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Address 2</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">City</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">State</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Zip</td>
</tr>
<tr>
	<td>
		<cfinput type="Text" required="no" name="Company_address1" class="RegText#session.workstream_text_size#">
	</td>
	<td>
		<cfinput type="Text" required="no" name="Company_address2" class="RegText#session.workstream_text_size#">
	</td>
	<td>
		<cfinput type="Text" required="no" name="company_City" class="RegText#session.workstream_text_size#">
	</td>
	<td>
		<cfselect name="company_State" query="get_states" display="state" value="state" size="1" class="RegText#session.workstream_text_size#"></cfselect>
	</td>
	<td>
		<cfinput type="Text" required="no" validate="zipcode" name="company_zip" size="5" message="Please enter a valid zip code" class="RegText#session.workstream_text_size#">
	</td>
</tr>