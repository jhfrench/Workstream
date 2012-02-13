
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
<cfset variables.width=min(numberformat(get_task_accumulated.image_width,"______"),variables.var1)>
<cfset variables.width2=variables.var1-variables.width>
</cfsilent>
	<tr class="RegText">
		<td colspan="2">
			&nbsp;&nbsp;
		</td>
		<td colspan="3" class="SubHeadText">
			Time Used&nbsp;
		</td>
	</tr>
	<tr class="RegText">
		<td colspan="2">
			&nbsp;&nbsp;
		</td>
		<td colspan="3">
			<cfoutput>
			<div style="height:20px; width:450px; border:1px solid;" title="Time used for #get_task_details.task_name# (#get_task_accumulated.hours_used# out of #get_task_accumulated.budgeted_hours# hours--#decimalformat(get_task_accumulated.percent_used)#%)">
			<cfif variables.width><img src="#request.dir_level##application.application_specific_settings.image_dir#bar_<cfif get_task_accumulated.percent_used GT 75>1<cfelseif get_task_accumulated.percent_used GT 50>3<cfelse>7</cfif>.gif" width="#variables.width#" height="20" alt="Percent of time used." border="0" /></cfif><cfif variables.width2><img src="#request.dir_level##application.application_specific_settings.image_dir#blank.gif" width="#variables.width2#" height="20" alt="Percent of time remaining." border="0" /></cfif>
			</div>
			</cfoutput>
		</td>
	</tr>

