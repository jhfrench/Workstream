
<!--Admin/dsp_load_profile.cfm
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
 --->
<cfoutput>
	<tr valign="top">
		<td align="center" colspan="2" valign="top">
			<br />&nbsp;<br />&nbsp;Select a profile: <cfselect name="profile_id" query="profile_lookup" value="profile_id" display="profile_name" size="2" required="Yes" message="Please choose a profile to load."></cfselect><br />&nbsp;<br />&nbsp;
		</td>
	</tr>
</cfoutput>

