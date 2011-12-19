
<!--Reports/pag_new_engage_output.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display new engagements by customer and month.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_new_engage_output.cfm">
<table align="center" border="0" cellpadding="1" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" align="center" colspan="3" gutter="0" section_color="008080" section_title="New Project Report" title_class="HeadText#session.workstream_text_size#White">
	<tr>
		<td valign="top">
			<cfinclude template="dsp_new_engage_chart.cfm">
		</td>
		<td valign="top">
			<cfinclude template="dsp_new_engage_graph.cfm">
		</td>
	</tr>
</table>


