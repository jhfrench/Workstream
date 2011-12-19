
<!--common_files/qry_task_attach.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I make the entries into the Task_Link table to bind tasks together.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:42:12  daugherty
	Initial revision

	Revision 1.0  2001-11-13 10:23:58-05  french
	Initial file creation.

	||
	--> attributes.base_task_id: number that uniquely defines the base task
	--> attributes.linked_task_id: list of tasks to be attached to a particular task
 --->
<cfquery name="task_attach" datasource="#application.datasources.main#">
	<cfloop list="#attributes.linked_task_id#" index="ii">
		INSERT INTO Task_Link(base_task_id, linked_task_id)
		VALUES(#attributes.base_task_id#,#ii#)
	</cfloop>
</cfquery>
</cfsilent>

