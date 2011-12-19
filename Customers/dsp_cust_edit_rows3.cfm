
<!--Customers/dsp_cust_edit_rows3.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:45:38  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:35-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->


	<tr>
		<cfoutput query="customer_change">
			<td colspan="2"><input type="text" name="name" value="#name#" size="25" class="RegText#session.workstream_text_size#"></td>
			<td colspan="2"><input type="text" name="lname" value="#lname#" size="25" class="RegText#session.workstream_text_size#"></td>
			<input type="Hidden" name="customer_id" value="#attributes.customer_id#">
		</cfoutput>
			<td>
				<cfinclude template="dsp_company_id_box.cfm">
				
			</td>
	</tr>

