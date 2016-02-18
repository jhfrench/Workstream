
<!--Reports/dsp_deadline_management_graph.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Deadline Management Report graph.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> due_year: number containing a year
	--> due_month: number containing a month
	--> on_time_percent: decimal number that indicates the number of tasks in the given due_year and due_month that were completed on time or early.
	END FUSEDOC --->

</cfsilent>
<div id="deadline_management_chart">
</div>