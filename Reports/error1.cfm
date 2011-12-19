
<!--Reports/error1.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the page that loads for errors on the reports module.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:09:54  stetzer
<>

Revision 1.1  2001-10-11 11:04:25-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->

<div align="center" class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>">There has been a problem with the report you requested. <br>
Please verify the date range that you selected and try to rerun your report.<br>
This Page will redirect you to the Report page. <br>
If the problem persists please notify The workstream Administrator.<br>
<a href="mailto:long@nucleusweb.com">long@nucleusweb.com</a><br>
Thank You</div>

<meta http-equiv="Refresh"  content="10; url=index.cfm">