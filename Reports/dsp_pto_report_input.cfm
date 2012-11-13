
<!--Reports/dsp_pto_report_input.cfm
	Author: Jeromy F -->
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
	<td valign="top">
		Name:
	</td>
	<td valign="top">
		<cfselect name="user_account_id" message="Please select an employee for your PTO report." required="yes" multiple="yes" size="#min(get_pto_names.recordcount,15)#">
			<cfif variables.all_option><option value="all" selected="selected">ALL</cfif>
			<cfoutput query="get_pto_names">
			<option value="#user_account_id#"<cfif variables.only_one> selected="selected"</cfif>>#last_name#, #first_name#</option>
			</cfoutput>
		</cfselect>
		<input type="hidden" name="flag_name" value="true">
	</td>
</tr>
<tr align="center">
	<td colspan="2">
		<input type="submit" value="Submit">
	</td>
</tr>
<cfif variables.only_one>
<script language="JavaScript">
	document.forms[0].submit();
</script>
</cfif>

