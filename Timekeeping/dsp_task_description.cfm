
<!--Timekeeping/dsp_task_description.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream project list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
</cfsilent>
	<tr>
		<td colspan="2">
			&nbsp;&nbsp;
		</td>
		<td colspan="3">
			<cfoutput>#Replace(ParagraphFormat(StripCR(get_task_details.description)),"<P>","","all")#</cfoutput>
		</td>
	</tr>

