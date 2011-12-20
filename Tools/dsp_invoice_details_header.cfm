
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
<tr align="center" class="SubHeadTextWhite">
	<td align="center" bgcolor="##9A588A" colspan="8" class="SubHeadTextWhite">
		&nbsp;#invoice_details.project_name#
	</td>
</tr>
<tr align="center" class="SubHeadText">
	<td align="center" class="SubHeadText">
		Month/Year
	</td>
	<td align="center" class="SubHeadText">
		Project Code
	</td>
	<td align="center" class="SubHeadText">
		Name
	</td>
	<td align="center" class="SubHeadText">
		Pin
	</td>
	<td align="center" class="SubHeadText">
		Rate<span class="RegText"> (per hour)</span>
	</td>
	<td align="center" class="SubHeadText">
		Hours
	</td>
	<td align="center" class="SubHeadText">
		Bill
	</td>
</tr>
</cfoutput>

