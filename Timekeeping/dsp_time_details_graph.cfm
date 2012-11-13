
<!--Timekeeping/dsp_time_details_graph.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream project list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfif listlen(get_task_details.used_hours,".") GT 1 AND listgetat(get_task_details.used_hours,2,".") GT 0>
	<cfset variables.used_hours=decimalformat(get_task_details.used_hours)>
<cfelse>
	<cfset variables.used_hours=numberformat(get_task_details.used_hours)>
</cfif>
</cfsilent>
<cfoutput>
	<div class="row-fluid">
		<div class="span12">
			<h5>Time Used</h5>
			<p>#variables.used_hours#<cfif get_task_details.budgeted_hours> out of #get_task_details.budgeted_hours# budgeted hours (#decimalformat(get_task_details.percent_used)#%)<cfif get_task_details.percent_used GT 100> <span class="badge badge-important"><i class="icon-fire icon-white"></i></span></cfif></cfif></p>
			<div class="progress progress-<cfif get_task_details.percent_used GT 75>danger<cfelseif get_task_details.percent_used GT 50>warning<cfelseif get_task_details.percent_used GT 25>info<cfelse>success</cfif>">
				<a href="javascript:list_to_time('#attributes.task_id#');" title="Reassign hours."><div class="bar" style="width: #lsnumberformat(get_task_details.percent_used)#%;"></div></a>
			</div>
		</div>
	</div>
</cfoutput>