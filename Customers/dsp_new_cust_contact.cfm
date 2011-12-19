
<!--Customers/dsp_new_cust_contact.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the rows for the contact information on the new customer input screen.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
    </cfsilent>
<tr>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		Name
	</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		Last Name
	</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		Phone
	</td>
	<td colspan="2" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		Email
	</td>
</tr>
<tr>
	<td>
		<cfinput type="Text" required="no" name="name" class="RegText#session.workstream_text_size#">
	</td>
	<td>
		<cfinput type="Text" required="no" name="lname" class="RegText#session.workstream_text_size#">
	</td>
	<td>
		<cfinput type="Text" required="no" name="phone" validate="telephone" class="RegText#session.workstream_text_size#">
	</td>
	<td colspan="2">
		<cfinput type="Text" required="no" name="email" class="RegText#session.workstream_text_size#">
	</td>		
</tr>