
<!--Customers/pag_new_customer.cfm
	Author: Jeromy F  -->
    <cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the new Create New Customer Root page.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:01  daugherty
Initial revision

Revision 1.2  2001-10-15 16:06:18-04  french
Remapped cfinclude for qry_get_states.cfm (moved to common_files).

Revision 1.1  2001-10-11 10:56:23-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	 
	(KL | 9/17/2001) removed the Align attribute from the cfform tag
	||
	END FUSEDOC --->
<cfinclude template="qry_get_companies.cfm">
<cfinclude template="../common_files/qry_get_states.cfm">

<cfform method="POST" action="index.cfm?fuseaction=add_customer">
<table cellpadding="3" cellspacing="0" border="0" align="center">
    <cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="008000" section_title="Add New Customer" colspan="6" gutter="false" align="center">
    <cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadText#session.workstream_text_size#" section_color="c0c0c0" section_title="Customer Information" colspan="6" gutter="false" align="left">
    <cfinclude template="dsp_new_cust_rows.cfm">
    <cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadText#session.workstream_text_size#" section_color="c0c0c0" section_title="Contact Information" colspan="6" gutter="false" align="left">
    <cfinclude template="dsp_new_cust_contact.cfm">
    <cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadText#session.workstream_text_size#" section_color="c0c0c0" section_title="Billing Information" colspan="6" gutter="false" align="Left">
    <cfinclude template="dsp_new_cust_bill.cfm">
	<tr>
		<td colspan="5">
		   <input type="Submit" name="submit" value="Enter New Customer" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">&nbsp;&nbsp;<input type="Reset" value="Reset" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
	</tr>
</table>
<div align="center" style="visibility: hidden;" id="shownote" class="Note<cfoutput>#session.workstream_text_size#</cfoutput>">*Note: If you select a root code yourself, make sure that it isn't used already.
</div>
</cfform>

