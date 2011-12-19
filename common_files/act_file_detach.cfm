
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
	<cfloop list="#del_file#" index="ii">
		<cfquery name="del_file" datasource="#application.datasources.main#">
		    DELETE 
			FROM Associated_Files
		    WHERE file_id = #ii#
		</cfquery>
	</cfloop>
	
