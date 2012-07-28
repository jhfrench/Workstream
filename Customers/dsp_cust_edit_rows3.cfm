
<!--Customers/dsp_cust_edit_rows3.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->


	<tr>
		<cfoutput query="customer_change">
			<td colspan="2"><input type="text" name="name" value="#name#" size="25"></td>
			<td colspan="2"><input type="text" name="lname" value="#lname#" size="25"></td>
			<input type="hidden" name="customer_id" value="#attributes.customer_id#">
		</cfoutput>
			<td>
				<cfinclude template="dsp_company_id_box.cfm">

			</td>
	</tr>

