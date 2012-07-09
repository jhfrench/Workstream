
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
 --->
</cfsilent>
<cfquery name="del_file" datasource="#application.datasources.main#">
UPDATE Link_Task_File
SET active_ind=0
WHERE l_t_f_id IN (#attributes.l_t_f_id#)
</cfquery>	
