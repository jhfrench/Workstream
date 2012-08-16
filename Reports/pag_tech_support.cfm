
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
<cfset variables.link='<a href="javascript:document.reset_cache.submit();" class="RegTextWhite">Update Graphs</a>'>
<cfparam name="session.workstream_cache_query" default="#now()#">
<cfif isdefined("attributes.reset_cache")>
	<cfset session.workstream_cache_query=now()>
</cfif>
</cfsilent>
<cfinclude template="qry_open_ts_tasks.cfm">
<cfinclude template="qry_historical_ts_data.cfm">
<cfinclude template="qry_ts_task_count.cfm">
<cfinclude template="qry_ts_completion_by_customer.cfm">
<cfinclude template="qry_ts_completion_by_product.cfm">
<!--- <cfinclude template="qry_ts_client_count.cfm"> --->
<!--- <cfinclude template="qry_ts_product_count.cfm"> --->
<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
	<cfmodule template="../common_files/dsp_section_title.cfm" align="center" colspan="8" gutter="0" section_color="008080" section_title="&nbsp;Tech Support" title_class="HeadTextWhite">
	<cfinclude template="dsp_open_ts_tasks.cfm">
	<cfmodule template="../common_files/dsp_section_title.cfm" align="left" colspan="8" gutter="0" section_color="5F5F5F" section_title="&nbsp;Monthly Comparison Graphs   (#variables.link#)" title_class="SubHeadTextWhite">
	<cfmodule template="../common_files/dsp_section_title.cfm" align="left" colspan="8" gutter="0" section_color="c0c0c0" section_title="&nbsp;Turnaround and Completion - Average Time per Task" title_class="RegTextBd">
	<cfinclude template="dsp_ts_turnaround_month.cfm">
	<cfmodule template="../common_files/dsp_section_title.cfm" align="left" colspan="8" gutter="0" section_color="c0c0c0" section_title="&nbsp;Tech support task count" title_class="RegTextBd">
	<cfinclude template="dsp_ts_task_count.cfm">
</table>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
	<cfmodule template="../common_files/dsp_section_title.cfm" align="left" colspan="3" gutter="0" section_color="5F5F5F" section_title="&nbsp;Completion Time Breakdown - Average Time per Task   (#variables.link#)" title_class="SubHeadTextWhite">
	<cfinclude template="dsp_ts_turnaround_break.cfm">
	<!--- <cfmodule template="../common_files/dsp_section_title.cfm" align="left" colspan="3" gutter="0" section_color="5F5F5F" section_title="&nbsp;Task Count Analysis-#variables.link#" title_class="SubHeadTextWhite">
	<cfinclude template="dsp_ts_counts.cfm"> --->
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="reset_cache" field_name="reset_cache" fuseaction="tech_support">

