
<!--common_files/dsp_file_attach_form.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I allow the user to associate a file path with a task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	<-- bgcolor: string that sets the backgroud color of this pop-up window
 --->
</cfsilent>
<cfoutput>
	<cfif isdefined("attributes.tempfilename")>
	<tr>
		<td width="10" class="SubHeadText#session.workstream_text_size#">
			&nbsp;
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			Currently attached files:
		</td>
	</tr>
	<tr>
		<td class="SubHeadText#session.workstream_text_size#">
			&nbsp;
		</td>
		<td class="SelectText#session.workstream_text_size#">
			<cfloop list="attributes.tempfilename" index="ii">#ii#<br></cfloop>
		</td>
	</tr>
	</cfif>
	<tr>
		<td class="SubHeadText#session.workstream_text_size#">
			&nbsp;
		</td>
		<td class="SelectText#session.workstream_text_size#">
			<span class="SubHeadText#session.workstream_text_size#">Select the file that you would like to attach.</span>
		</td>
	</tr>
<!--- $issue$: we do need to come up with a company-wide network drive--perhaps something with dropbox or similar, mapped to a consistent Drive letter?
	<tr>
		<td class="SubHeadText#session.workstream_text_size#">
			&nbsp;
		</td>
		<td class="SelectText#session.workstream_text_size#">
			Please save the file in Spinnaker/timekeeping documents to attach it to a task.
		</td>
	</tr> --->
<form action="" method="post" enctype="multipart/form-data" name="tempform" id="junk"  onsubmit="return false">
	<tr>
		<td class="SubHeadText#session.workstream_text_size#">
			&nbsp;
		</td>
		<td class="RegText#session.workstream_text_size#">
			<input type="file" name="tempfilename" size="40" value="" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</form>
<form action="##" method="post" name="realform">
	<tr>
		<td class="SubHeadText#session.workstream_text_size#">
			&nbsp;
		</td>
		<td class="RegText#session.workstream_text_size#">
			<input type="hidden" name="filename" value="">
			<input type="hidden" name="submit_flag" value="1">
			<input type="hidden" name="additions" value="">
			<input type="submit" value="Submit" onclick="sync_files()" class="RegText#session.workstream_text_size#">
			<input type="button" name="addfile" onclick="sync_files()" value="Attach another file " class="RegText#session.workstream_text_size#">
			<input type="button" name="test" onclick="checkfields()" value="Check Additions" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</form>
</cfoutput>

