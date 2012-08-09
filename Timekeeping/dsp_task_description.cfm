
<!--Timekeeping/dsp_task_description.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the task name and description.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<cfoutput>
	<div class="row-fluid">
		<div class="span12">
			<h2>#get_task_details.task_name# <a href="javascript:note_to_task('#attributes.task_id#');" class="btn">View this task</a></h2>
			<h5>Task details</h5>
			<p>#replace(paragraphformat(stripcr(get_task_details.description)),"<P>","","all")#</p>
		</div>
	</div>
</cfoutput>