
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
	<td class="SubHeadText">
		Name
	</td>
	<td class="SubHeadText">
		Last Name
	</td>
	<td class="SubHeadText">
		Phone
	</td>
	<td colspan="2" class="SubHeadText">
		Email
	</td>
</tr>
<tr>
	<td>
		<cfinput type="text" required="no" name="name">
	</td>
	<td>
		<cfinput type="text" required="no" name="lname">
	</td>
	<td>
		<cfinput type="text" required="no" name="phone" validate="telephone">
	</td>
	<td colspan="2">
		<cfinput type="text" required="no" name="email">
	</td>
</tr>