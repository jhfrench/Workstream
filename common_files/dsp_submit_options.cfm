
<!--Admin/dsp_submit_options.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream Admin submit buttons.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfparam name="attributes.include_reset" default="1">
<cfparam name="attributes.reset_value" default="Reset these options">
<cfparam name="attributes.submit_value" default="Save these options">
<cfparam name="request.colspan" default="2">
</cfsilent>
<cfoutput>
	<tr align="center">
		<td align="center" colspan="#request.colspan#">
			<cfif attributes.include_reset><input type="Reset" value="#attributes.reset_value#">&nbsp;</cfif><input type="submit" value="#attributes.submit_value#">
		</td>
	</tr>
</cfoutput>

