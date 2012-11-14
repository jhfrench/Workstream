
<!--Reports/pag_new_project.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display new projects by customer and month.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_new_project_output.cfm">

<div class="row-fluid">
	<div class="span6">
		<cfinclude template="dsp_new_project_chart.cfm">
	</div>
	<div class="span6">
		<cfinclude template="dsp_new_project_graph.cfm">
	</div>
</div>
<cfinclude template="dsp_new_project_input.cfm">