
<!-- reports/dsp_lost_time_row_headers.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the row headers for the lost time report.

	||
	Edits: 
	$Log$
	Revision 1.1  2005/03/09 18:07:44  stetzer
	<>

	Revision 1.1  2001-11-29 13:41:22-05  long
	rolled up vacation, authorized leave, and sick into pto

	Revision 1.0  2001-11-27 15:44:27-05  long
	Created File

	||
	Variables:
	
	END FUSEDOC --->
</cfsilent>
	<tr class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>White" bgcolor="#008080">
		<td>
			Employee 
		</td>
		<!--- <td>
			Authorized Leave 
		</td> --->
		<td>
			Bereavement
		</td>	
		<td>
			Holiday
		</td>
		<td>
			Jury Duty 
		</td>		

		<!--- <td>
			Sick
		</td> --->
		<td>
			STD/LTD
		</td>
		<td>
			Unpaid
		</td>
		<!--- <td>
			Vacation
		</td> --->
		<td>
			PTO
		</td>
		<td>
			Total
		</td>
	</tr>