
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
		<cfinput type="Text" required="no" name="name" class="RegText">
	</td>
	<td>
		<cfinput type="Text" required="no" name="lname" class="RegText">
	</td>
	<td>
		<cfinput type="Text" required="no" name="phone" validate="telephone" class="RegText">
	</td>
	<td colspan="2">
		<cfinput type="Text" required="no" name="email" class="RegText">
	</td>		
</tr>