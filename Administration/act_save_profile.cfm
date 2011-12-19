
<!--Admin/act_save_profile.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2006/09/15 22:24:41  csy
<>

Revision 1.0  2006-08-16 09:31:58-04  csy
Initial revision

Revision 1.0  2005-02-15 15:27:20-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:40-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfinclude template="../common_files/qry_profile_lookup.cfm">
<cfif profile_lookup.recordcount>
	<cfinclude template="qry_delete_profile.cfm">
</cfif>
<cfinclude template="qry_create_profile.cfm">
</cfsilent>

