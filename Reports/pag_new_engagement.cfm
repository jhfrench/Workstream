
<!--Reports/pag_new_engage_output.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display new engagements by customer and month.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_new_engage_output.cfm">

<div class="row-fluid">
	<div class="span6">
		<cfinclude template="dsp_new_engage_chart.cfm">
	</div>
	<div class="span6">
		<cfinclude template="dsp_new_engage_graph.cfm">
	</div>
</div>
<cfinclude template="dsp_new_engage_input.cfm">