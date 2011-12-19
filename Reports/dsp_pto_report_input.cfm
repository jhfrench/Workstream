
<!--Reports/dsp_pto_report_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the PTO roport input page.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfset variables.only_one=0>
<cfif get_pto_names.recordcount EQ 1 AND NOT get_all_option.all_option>
	<cfset variables.only_one=1>
</cfif>
</cfsilent>
<tr align="center">
	<td valign="top" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		Name:
	</td>
	<td valign="top" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<cfselect name="form_pin" message="Please select an employee for your PTO report." required="Yes" multiple="Yes" size="#min(get_pto_names.recordcount,15)#" class="Regtext#session.workstream_text_size#">
			<cfif variables.all_option><option value="all" SELECTED>ALL</cfif>
			<cfoutput query="get_pto_names">
			<option value="#emp_id#"<cfif variables.only_one> SELECTED</cfif>>#lname#, #name#</option>
			</cfoutput>
		</cfselect>
		<input type="hidden" name="flag_name" value="true">
	</td>
</tr>
<tr align="center">
	<td colspan="2">
		<input type="submit" value="Submit" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
	</td>
</tr>
<cfif variables.only_one>
<script language="JavaScript">
	document.forms[0].submit();
</script>
</cfif>

