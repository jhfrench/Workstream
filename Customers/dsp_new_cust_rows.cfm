
<!--Customers/dsp_new_cust_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:45:50  daugherty
	Initial revision

	||
	END FUSEDOC --->
<tr>
	<td>
		<input type="button" name="Root_Code" value="Specify A Root Code" onclick="javascript:document.all.showlayer.style.visibility='visible';javascript:document.all.shownote.style.visibility='visible';" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
	</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Company</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Visible to</td>
</tr>
<tr>
	<td valign="top" style="visibility: hidden;" id="showlayer" class="Note<cfoutput>#session.workstream_text_size#</cfoutput>">
		<cfinput type="Text" required="No"  name="root_code" size="4" class="RegText#session.workstream_text_size#">&nbsp;*
	</td>
	<td valign="top">
		<cfselect name="company_ID" message="Please Select a Company" query="get_companies" value="company_id" display="Company" selected="#session.workstream_company_name#" required="Yes" size="1" class="RegText#session.workstream_text_size#"></cfselect>
	</td>
	<td valign="top" rowspan="3">
		<cfselect name="Visible_to" message="Please Select a Company" query="get_companies" value="company_id" display="Company" required="No" size="6" multiple="Yes" class="RegText#session.workstream_text_size#"></cfselect>
	</td>
</tr>
<tr>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Root Name</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Billable</td>
</tr>
<tr>
	<td>
		<cfinput type="Text" required="Yes" message="Please enter a Root Name" name="description" class="RegText#session.workstream_text_size#">
	</td>
	<td>
		<cfselect name="billable_id" size="1" class="RegText#session.workstream_text_size#">
			<option value="1" selected>Yes
			<option value="2">No
		</cfselect>
	</td>
</tr>
		