
<!--Admin/dsp_save_profile.cfm
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
			<br />&nbsp;<br />&nbsp;Profile name: <cfinput type="text" name="profile_name" required="yes" message="Please enter a profile name.">
		</td>
	</tr>
	<tr valign="top">
		<td align="center" colspan="2" valign="top">
			<label for="primary_profile_ind"><input type="checkbox" name="primary_profile_ind" id="primary_profile_ind"> Make this my primary profile</label><br />&nbsp;<br />&nbsp;
		</td>
	</tr>
</cfoutput>

