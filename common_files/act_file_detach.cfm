
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
Revision 1.0  2005/02/15 20:41:03  daugherty
Initial revision

Revision 1.1  2001-10-11 10:58:04-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
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
	
