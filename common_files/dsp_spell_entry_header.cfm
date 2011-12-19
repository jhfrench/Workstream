
<!--common_files/dsp_spell_entry_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the header for the spell check function.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfoutput>
	<tr bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td<cfif isdefined("colspan")> colspan="#colspan#"</cfif> class="SubHeadText#session.workstream_text_size#">
			Spell Check: #formname#
		</td>
	</tr>
</cfoutput>

