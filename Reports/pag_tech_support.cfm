
<!--Reports/pag_tech_support.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I show, at a glance, important statistics about the Nucleus Tech Support process including which tasks are currently unresolved and which products require the most maintenance..
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfset variables.link='<a href="javascript:document.reset_cache.submit();" class="btn">Update Graphs</a>'>
<cfparam name="attributes.report_cached_within" default="0,0,10,0">
</cfsilent>
<cfinclude template="qry_open_ts_tasks.cfm">
<cfinclude template="qry_get_tech_support_historical.cfm">
<cfinclude template="qry_ts_task_count.cfm">
<cfinclude template="qry_get_tech_support_completion_by_customer.cfm">
<cfinclude template="qry_get_tech_support_completion_by_product.cfm">
<h1>Tech Support</h1>
<cfinclude template="dsp_tech_support_open_tasks.cfm">


<!--- <cfinclude template="qry_get_tech_support_client_count.cfm"> --->
<!--- <cfinclude template="qry_ts_product_count.cfm"> --->
<h2>Monthly Trend Graphs #variables.link#</h2>
<div class="row-fluid">
	<div class="span6">
		<h3>Turnaround and Completion <small>Average Time Per Task</small></h3>
		<cfinclude template="dsp_tech_support_turnaround_month_trend_graph.cfm">
	</div>
	<div class="span6">
		<h3>Tech support task count</h3>
		<cfinclude template="dsp_tech_support_task_count_month_trend_graph.cfm">
	</div>
</div>

<h2>Benchmarking Graphs #variables.link#</h2>
<div class="row-fluid">
	<div class="span6">
		<h3>By Customer <small>Average Time Per Task</small></h3>
		<cfinclude template="dsp_tech_support_completion_by_customer.cfm">
	</div>
	<div class="span6">
		<h3>By Product <small>Average Time Per Task</small></h3>
		<cfinclude template="dsp_tech_support_completion_by_product.cfm">
	</div>
</div>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="reset_cache" field_name="report_cached_within" field_value="0,0,0,1" fuseaction="Reports.tech_support">