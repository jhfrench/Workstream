
<!--Timekeeping/dsp_task_new_table.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the attributes of a task. If a task is not specified I display the form to set task details/create a new task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<div class="row-fluid">
	<div class="span4">
		<cfinclude template="dsp_task_new_col_left.cfm">
	</div>
	<div class="span8">
		<cfinclude template="dsp_task_new_col_right.cfm">
	</div>
</div>
<div class="row-fluid">
	<div class="span12">
		<input type="hidden" name="last_loaded" value="<cfoutput>#now()#</cfoutput>" />
		<input type="hidden" name="to_inbox" value="" />
		<input type="hidden" name="to_edit" value="" />
		<div class="btn-group">
			<input type="button" value="Create New Task" class="btn btn-mini" onclick="checkTheDescription('');" />
			<input type="button" value="Submit To Inbox" class="btn btn-mini btn-primary" onclick="checkTheDescription('to_inbox');" />
			<input type="button" value="Create And Edit" class="btn btn-mini" onclick="checkTheDescription('to_edit');" />
		</div>
	</div>
</div>
<div class="row-fluid">
	<div class="span6">
		<cfinclude template="dsp_associated_files.cfm">
		<cfinclude template="dsp_associated_tasks.cfm">
	</div>
	<div class="span6">
		<cfinclude template="dsp_task_reminder.cfm">
		<cfinclude template="dsp_task_notification.cfm">
	</div>
</div>