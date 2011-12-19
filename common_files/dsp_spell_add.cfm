
<!--common_files/dsp_spell_add.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I email a word recommended to be added to the dictionary.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfoutput>
	<tr>
		<td colspan="4" align="center" class="SubHeadText#session.workstream_text_size#">
			The word '#attributes.suggested_word#' has been recommended for inclusion in the workstream dictionary
		</td>
	</tr>
</cfoutput>
