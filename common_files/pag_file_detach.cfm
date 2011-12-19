
<!--common_files/pag_file_detach.cfm
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
Revision 1.0  2005/02/15 20:41:39  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:44-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	<-- bgcolor: string that sets the backgroud color of this pop-up window
 --->
<cfset bgcolor="##78A0EB">
<cfparam name="attributes.submit_flag" default=0>
</cfsilent>
<cfif isdefined("attributes.del_file")>
	<cfinclude template="act_file_detach.cfm">
</cfif>
<cfinclude template="qry_get_associated_files.cfm">
<table align="center">
<cfinclude template="dsp_file_detach_head.cfm">
<cfif get_associated_files.recordcount>
	<cfinclude template="dsp_file_detach_form.cfm">
<cfelse>
<cfinclude template="dsp_file_detach_neg.cfm">
</cfif>
</table>

