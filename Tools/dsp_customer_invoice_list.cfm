
<!--Tools/dsp_invoice_list.cfm
	Author: Jeromy F -->
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
<cfoutput query="get_customer_invoice_list">
	<tr>
		<td>
			<a href="javascript:customer_to_project(#customer_id#);">#customer_name#</a>
		</td>
		<td class="number">
			#dollarformat(revenue)#
		</td>
		<td>
			<input type="checkbox" name="customer_id" value="#customer_id#" /><!--- this should be converted into a link styled as a button --->
		</td>
	</tr>
</cfoutput>