
<!--Tools/dsp_tools_home.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the home page for the tools module.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfset startrow=1>
<cfset max_rows=int(get_tools.recordcount/3)>
</cfsilent>
<tr valign="top">
	<td width="10%" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		These tools were designed to help you do your work and improve your productivity.
	</td>
	<cfoutput query="get_tools">
	<td width="30%">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="772862" section_title="#report_name#" title_class="HeadText#session.workstream_text_size#White">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="#description#" title_class="RegText#session.workstream_text_size#">
<cfset startrow=incrementvalue(startrow)>
		</table>
	</td>
	<cfif currentrow mod 3 EQ 0></tr>
	<tr valign="top">
		<td></td></cfif>
	</cfoutput>
	</tr>
</table>

