
<!--Search/dsp_search_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the header for the search page.
	||
	Name: 
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:58:22  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:27-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
	<tr>
		<td colspan="3" align="left" bgcolor="#E2B412" class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>White">&nbsp;Nucleus Knowledge Base Search</td>
	</tr>
	