
<!--Reports/pag_code_report_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:10:36  stetzer
	<>

	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/qry_project_code.cfm">
<cfform action="index.cfm?fuseaction=Reports.code_Report" method="POST" name="code">
<table align="center" border="0" cellpadding="4" cellspacing="0">
	<tr class="subheadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td>
			<cfmodule template="dsp_from_through_date_no_form.cfm" report_name="Code Report" form_name="code" required="yes">
		</td>
	</tr>
	<tr>
		<td align="center">
			<cfinclude template="dsp_code_report_input.cfm">
		</td>
	</tr>
	<tr>
		<td align="center">
			<input type="submit" name="Enter_Date" value="Enter Criteria" size="10" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
	</tr>
</table>
</cfform>

