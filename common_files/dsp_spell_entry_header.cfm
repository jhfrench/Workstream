
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
 --->
<cfoutput>
	<tr bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td<cfif isdefined("colspan")> colspan="#colspan#"</cfif> class="SubHeadText">
			Spell Check: #formname#
		</td>
	</tr>
</cfoutput>

