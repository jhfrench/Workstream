
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
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr bgcolor="##5F5F5F">
	<td colspan="2" class="SubHeadTextWhite">
		<label for="hide_supervisor">
			<input type="Checkbox"<cfif isdefined("attributes.hide_supervisor")> checked</cfif> name="hide_supervisor" value="1" onclick="javascript:document.drill_down.submit();" id="hide_supervisor" class="SubHeadTextWhite"> Remove your data
		</label>
	</td>
</tr>
</cfoutput>

