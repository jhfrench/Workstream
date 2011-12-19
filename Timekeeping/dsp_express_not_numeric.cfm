
<!--Timekeeping/dsp_express_not_numeric.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display a meesage that notifies the user that their hour entries were not numeric.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:21:05  stetzer
<>

Revision 1.1  2001-10-11 10:55:11-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
	<tr align="center" class="Note<cfoutput>#session.workstream_text_size#</cfoutput>BdRed">
		<td colspan="5" class="Note<cfoutput>#session.workstream_text_size#</cfoutput>BdRed">
			One or more of the entries you just submitted contained hours that were not numeric. These entries were not processed:
		</td>
	</tr>
	<tr align="center" class="Note<cfoutput>#session.workstream_text_size#</cfoutput>BdRed">
		<td align="left" class="Note<cfoutput>#session.workstream_text_size#</cfoutput>BdRed">
			&nbsp;
		</td>
		<td align="left" colspan="4" class="Note<cfoutput>#session.workstream_text_size#</cfoutput>BdRed">
			<ul class="Note<cfoutput>#session.workstream_text_size#</cfoutput>BdRed">
			<cfloop list="#notnumericentries#" index="ii">
				<li><cfoutput>#ii#</cfoutput></li>
			</cfloop>
			</ul>
		</td>
	</tr>
