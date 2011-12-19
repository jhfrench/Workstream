
<!--Search/dsp_search_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the header for the search page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
	<tr bgcolor="#c0c0c0">
		<td align="center" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Include<br>in Search</td>
		<td align="Left" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Search<br>Item</td>
		<td align="Left" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Search<br>Criteria</td>
	</tr>
