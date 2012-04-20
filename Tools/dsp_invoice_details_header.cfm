
<!--Tools/dsp_invoice_details_header.cfm
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
<tr>
	<th>
		Month/Year
	</th>
	<td>
		Project Code
	</th>
	<th>
		Name
	</th>
	<th>
		Pin
	</th>
	<th>
		Rate<span class="RegText"> (per hour)</span>
	</th>
	<th>
		Hours
	</th>
	<th>
		Bill
	</th>
</tr>
</cfoutput>