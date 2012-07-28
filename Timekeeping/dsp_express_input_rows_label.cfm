
<!--Timekeeping/dsp_express_input_rows_label.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the column labels for the express entry rows.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
	<tr bgcolor="#0000FF" class="HeadTextWhite">
		<td align="center" colspan="4">
			<em>-Express=</em> Time Entry
		</td>
	</tr>
	<cfoutput><tr align="center" bgcolor="##C0C0C0" class="SubHeadText">
		<td align="center" class="SubHeadText">
			Date
		</td>
		<td align="center" class="SubHeadText">
			Hours
		</td>
		<td align="center" class="SubHeadText">
			<cfif compare(fuseaction, "time_entry")>
				Task
			<cfelse>
				Code
			</cfif>
		</td>
		<td align="center" class="SubHeadText">
			Notes
		</td>
	</tr></cfoutput>

