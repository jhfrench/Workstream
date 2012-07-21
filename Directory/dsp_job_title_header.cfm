
<!--Directory/dsp_job_title_entry_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the header for the job title entry function.
	||
	Name: Jeromy French
	||
	Edits:
	$Log: 
	 || 
 --->
</cfsilent>
<cfoutput>
	<tr bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td<cfif isdefined("colspan")> colspan="#colspan#"</cfif> class="SubHeadText">
			<strong>Job Title Entry Form</strong>
		</td>
		<td<cfif isdefined("colspan")> colspan="#colspan#"</cfif> class="SubHeadText">
			&nbsp;
		</td>
	</tr>
</cfoutput>

