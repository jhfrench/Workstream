
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
	<-- bgcolor: string that sets the backgroud color of this pop-up window
 --->
</cfsilent>
<!--- $issue$: does this get used? --->
<cfoutput>
	<cfif isdefined("attributes.tempfilename")>
	<tr>
		<td width="10" class="SubHeadText">
			&nbsp;
		</td>
		<td class="SubHeadText">
			Currently attached files:
		</td>
	</tr>
	<tr>
		<td class="SubHeadText">
			&nbsp;
		</td>
		<td class="SelectText">
			<cfloop list="attributes.tempfilename" index="ii">#ii#<br /></cfloop>
		</td>
	</tr>
	</cfif>
	<tr>
		<td class="SubHeadText">
			&nbsp;
		</td>
		<td class="SelectText">
			<span class="SubHeadText">Select the file that you would like to attach.</span>
		</td>
	</tr>
<!--- $issue$: we do need to come up with a company-wide network drive--perhaps something with dropbox or similar, mapped to a consistent Drive letter? --->
<form action="" method="post" enctype="multipart/form-data" name="tempform" id="junk" onsubmit="return false">
	<tr>
		<td class="SubHeadText">
			&nbsp;
		</td>
		<td>
			<input type="file" name="tempfilename" size="40" value="">
		</td>
	</tr>
</form>
<form action="##" method="post" name="realform">
	<tr>
		<td class="SubHeadText">
			&nbsp;
		</td>
		<td>
			<input type="hidden" name="filename" value="" />
			<input type="hidden" name="submit_flag" value="1" />
			<input type="hidden" name="additions" value="" />
			<input type="submit" value="Submit" onclick="sync_files()" class="btn btn-primary" />
			<input type="button" name="addfile" onclick="sync_files()" value="Attach another file" class="btn" />
			<input type="button" name="test" onclick="checkfields()" value="Check Additions" class="btn" />
		</td>
	</tr>
</form>
</cfoutput>

