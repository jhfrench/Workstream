
<!--common_files/dsp_big_list_submit.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display a submit button with the RegText style sheet applied.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
	<tr>
		<td align="center"> 
			<input type="button"  Value="Return" onClick="OKButton()" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
	</tr>

