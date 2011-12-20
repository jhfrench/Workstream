
<!--Customers/pag_new_customer.cfm
	Author: Jeromy F  -->
    <cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the new Create New Customer Root page.
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
    </cfsilent>
<cfinclude template="qry_get_companies.cfm">
<cfinclude template="../common_files/qry_get_states.cfm">

<cfform method="POST" action="index.cfm?fuseaction=Customers.add_customer">
<table cellpadding="3" cellspacing="0" border="0" align="center">
    <cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="008000" section_title="Add New Customer" colspan="6" gutter="false" align="center">
    <cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadText" section_color="c0c0c0" section_title="Customer Information" colspan="6" gutter="false" align="left">
    <cfinclude template="dsp_new_cust_rows.cfm">
    <cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadText" section_color="c0c0c0" section_title="Contact Information" colspan="6" gutter="false" align="left">
    <cfinclude template="dsp_new_cust_contact.cfm">
    <cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadText" section_color="c0c0c0" section_title="Billing Information" colspan="6" gutter="false" align="Left">
    <cfinclude template="dsp_new_cust_bill.cfm">
	<tr>
		<td colspan="5">
		   <input type="submit" name="submit" value="Enter New Customer" class="RegText">&nbsp;&nbsp;<input type="Reset" value="Reset" class="RegText">
		</td>
	</tr>
</table>
</cfform>

