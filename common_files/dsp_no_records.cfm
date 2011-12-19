
<!--Reports/Dsp_no_records.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the message that the user has requested a report with no results.

	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
<br>&nbsp;<br>&nbsp;
<div align="center" class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>">You have selected a report that has no entries in it.  Please click "BACK" and try a different report.</div>
