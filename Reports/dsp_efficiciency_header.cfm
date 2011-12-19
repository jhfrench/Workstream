
<!--Reports/dsp_efficiciency_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the column that gives efficiency report options.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:05:26  stetzer
	<>

	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr bgcolor="##5F5F5F">
	<td colspan="2" class="SubHeadText#session.workstream_text_size#White">
		<label for="hide_supervisor">
			<input type="Checkbox"<cfif isdefined("attributes.hide_supervisor")> checked</cfif> name="hide_supervisor" value="1" onclick="javascript:document.drill_down.submit();" id="hide_supervisor" class="SubHeadText#session.workstream_text_size#White"> Remove your data
		</label>
	</td>
</tr>
</cfoutput>

