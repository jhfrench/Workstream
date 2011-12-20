
<!--Tools/dsp_invoice_list.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the column headers for the invoice list.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr class="SubHeadText">
	<td class="SubHeadText">
		Customer
	</td>
	<td class="SubHeadText">
		Total Monthly Bill
	</td>
	<td class="SubHeadText">
		Generate Invoice
	</td>
</tr>
<cfloop query="get_customer_invoice_list">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif> class="RegText">
		<td class="RegText">
			<a href="javascript:customer_to_project(#customer_id#);" class="RegText">#customer_name#</a>
		</td>
		<td align="right" class="RegText">
			#revenue#
		</td>
		<td align="right" class="RegText">
			<input type="checkbox" name="customer_id" value="#customer_id#">
		</td>
	</tr>
</cfloop>
</cfoutput>