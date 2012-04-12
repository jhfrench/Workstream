
<!--Reports/dsp_efficiency_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the efficiency report for the engagement that corresponds to what the user requests (as determined by the fuseaction).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr>
		<td valign="top">
			<cfinclude template="dsp_efficiency_report_chart.cfm">
		</td>
		<td align="center" valign="top" class="SubHeadText">
			<br />
			<cfinclude template="dsp_efficiency_report_graph.cfm">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<cfinclude template="dsp_efficiency_report_sub.cfm">
		</td>
	</tr>
</cfoutput>

