
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
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
	<tr>
		<td colspan="3" align="left" bgcolor="#E2B412" class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>White">&nbsp;Nucleus Knowledge Base Search</td>
	</tr>
	