
<!--common_files/act_file_detach.cfm
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
 --->
<cfquery name="del_file" datasource="#application.datasources.main#">
UPDATE Associated_File
SET active_ind=0
WHERE file_id IN (#attributes.deleted_file_id#)
</cfquery>	
