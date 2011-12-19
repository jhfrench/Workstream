
<!--directory/dsp_benefits_entry_header.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the header for the benefits entry function.
	||
	Name: Damon Scott
	||
	Edits:
$Log: 

 
	||
 --->
<cfoutput>
	<tr bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td<cfif isdefined("colspan")> colspan="#colspan#"</cfif> class="SubHeadText#session.workstream_text_size#">
			<strong>Benefits Entry Form</strong>
		</td>
		<td<cfif isdefined("colspan")> colspan="#colspan#"</cfif> class="SubHeadText#session.workstream_text_size#">
			&nbsp;
		</td>
	</tr>
</cfoutput>

