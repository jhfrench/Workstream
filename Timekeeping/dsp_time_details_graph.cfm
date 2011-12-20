
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfset width=min(get_task_accumulated.image_width,variables.var1)>
<cfset width2=variables.var1-width>
<cfset alt="Time used for #get_task_details.task_name# (#get_task_accumulated.hours_used# out of #get_task_accumulated.budgeted_hours# hours--#decimalformat(get_task_accumulated.percent_used)#%)">
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
			<table border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
				<tr>
					<td valign="middle">
						<cfoutput><cfif width><img src="#request.dir_level##application.application_specific_settings.image_dir#bar_<cfif get_task_accumulated.percent_used GT 75>1<cfelseif get_task_accumulated.percent_used GT 50>3<cfelse>7</cfif>.gif" width="#width#" height="20" alt="#alt#" border="0"></cfif><cfif width2><img src="#request.dir_level##application.application_specific_settings.image_dir#blank.gif" width="#width2#" height="20" alt="#alt#" border="0"></cfif></cfoutput></td>
				</tr>
			</table>
		</td>
	</tr>

