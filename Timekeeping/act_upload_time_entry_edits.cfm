
<!--Timekeeping/act_upload_time_entry_edits.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I call the queries that update the Notes and Time_Entry tables with the information returned from pag_time_entry_edit.cfm.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:20:30  stetzer
<>

Revision 1.1  2001-10-11 10:55:15-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
 --->
</cfsilent>
<cfinclude template="qry_edit_time_entry.cfm">
<cfinclude template="qry_edit_notes.cfm">
