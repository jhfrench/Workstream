
<!--common_files/pag_file_attach.cfm
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
 <!--- $issue$: need to convert all of this to use cffile because modern browsers don't share full path name with JavaScript--->
<cfset bgcolor="##78A0EB">
<cfparam name="attributes.submit_flag" default=0>
<cfparam name="additions" default="">
</cfsilent>
<cfinclude template="act_file_attach.cfm">
<cfif NOT attributes.submit_flag>
<cfoutput>
<table cellspacing="2" cellpadding="0" width="100%" border="0" align="center" class="SelectText#session.workstream_text_size#">
<cfinclude template="dsp_file_attach_header.cfm">
<cfinclude template="dsp_file_attach_form.cfm">
</table>
</cfoutput>
</cfif>

