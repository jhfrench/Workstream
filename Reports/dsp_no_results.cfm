
<!--Reports/dsp_no_results.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display if the report that the user requested has returned no results.

	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<table align="center" cellpadding="4" cellspacing="0" border="0" width="95%">
	<tr class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td align="center"><br>&nbsp;<br>&nbsp;The report you requested has returned no results.  Please click the "Back" button to try to run your report again.</td>
	</tr>
</table>
