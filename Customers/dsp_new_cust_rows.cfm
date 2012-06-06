
<!--Customers/dsp_new_cust_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities:
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
    </cfsilent>
<tr>
	<td class="SubHeadText">Root Code</td>
	<td class="SubHeadText">Company</td>
	<td class="SubHeadText">Visible to</td>
</tr>
<tr>
	<td valign="top" class="Note">
		<div id="code_options">
		<a href="javascript:void(0);" onclick="javascript:Element.toggle('root_code_entry');Element.toggle('code_options');">Specify A Root Code</a>
		</div>
		<div id="root_code_entry" style="display:none;">
		<cfinput type="Text" required="No"  name="root_code" size="4">&nbsp;*<br />
		Note: If you select a root code yourself, make sure that it isn't used already.
		</div>
	</td>
	<td valign="top">
		<cfselect name="company_id" message="Please Select a Company" query="get_companies" value="company_id" display="description" selected="#session.workstream_company_name#" required="Yes" size="1"></cfselect>
	</td>
	<td valign="top" rowspan="3">
		<cfselect name="Visible_to" message="Please Select a Company" query="get_companies" value="company_id" display="description" required="No" size="6" multiple="Yes"></cfselect>
	</td>
</tr>
<tr>
	<td class="SubHeadText">Root Name</td>
	<td class="SubHeadText">Billable</td>
</tr>
<tr>
	<td>
		<cfinput type="Text" required="Yes" message="Please enter a Root Name" name="description">
	</td>
	<td>
		<cfselect name="billable_type_id" size="1">
			<option value="1" selected>Yes
			<option value="2">No
		</cfselect>
	</td>
</tr>
		