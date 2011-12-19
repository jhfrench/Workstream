
<!--Reports/Dsp_no_records.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the message that the user has requested a report with no results.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:26  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:51-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
<br>&nbsp;<br>&nbsp;
<div align="center" class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>">You have selected a report that has no entries in it.  Please click "BACK" and try a different report.</div>
