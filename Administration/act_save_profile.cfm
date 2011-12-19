
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
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfinclude template="../common_files/qry_profile_lookup.cfm">
<cfif profile_lookup.recordcount>
	<cfinclude template="qry_delete_profile.cfm">
</cfif>
<cfinclude template="qry_create_profile.cfm">
</cfsilent>

