
<!--Reports/dsp_no_results.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display if the report that the user requested has returned no results.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:08:19  stetzer
<>

Revision 1.1  2001-10-11 11:04:33-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<table align="center" cellpadding="4" cellspacing="0" border="0" width="95%">
	<tr class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td align="center"><br>&nbsp;<br>&nbsp;The report you requested has returned no results.  Please click the "Back" button to try to run your report again.</td>
	</tr>
</table>
