
<!--Admin/dsp_profile_message.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the timekeeping options.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfoutput>
	<tr valign="top">
		<td align="center" colspan="2" valign="top" class="SubHeadText">
			<br>&nbsp;
			<br>&nbsp;
			Your profile has been <cfif comparenocase(listlast(attributes.fuseaction, '.'),"load_profile")>sav<cfelse>load</cfif>ed.
			<br>&nbsp;
			<br>&nbsp;
		</td>
	</tr>
</cfoutput>

