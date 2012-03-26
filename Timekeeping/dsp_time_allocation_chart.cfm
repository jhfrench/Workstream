
<!--Timekeeping/dsp_time_allocation_chart.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the time allocation chart that shows projects and time worked on those projects.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	<-> variables.allocation_percent: number of hours spent on a particular project divided by the total number of hours worked during the same time range
	--> variables.color_list: list of hexadecimal color values
	--> project_hours: number of hours spent on a particular project
	--> project_name: name of the project
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<div class="HeadTextWhite" style="background-color:##78A0EB; width:100%;">Work Allocation</div>
<cfif time_allocation_blurb.recordcount>
<script src="common_files/jquery-1.7.1.min.js?cache_escape=#variables.cache_escape#"></script>
<!--[if IE]>
<script src="common_files/excanvas.js?cache_escape=#variables.cache_escape#"></script>
<![endif]-->
<script src="common_files/pie_graph.js?cache_escape=#variables.cache_escape#"></script>
<div id="work_allocation">
	<p class="RegText">#variables.work_allocation_text#</p>
	<div style="float:left; width:64%;">
		<canvas id="chart" width="300" height="250" style="cursor:pointer;">
			We regret to inform you that your browser does not support canvas, a basic <a href="http://www.html5rocks.com">HTML5</a> feature.
		</canvas>
	</div>
	<div style="float:right; width:35%;">
		<table id="chartData" class="table_striped" cellspacing="0">
			<thead>
				<tr bgcolor="##c0c0c0">
					<th colspan="2" title="label">Project</th><th>Hours</th>
				</tr>
			</thead>
			<tbody style="cursor: pointer;">
			<cfloop query="time_allocation_blurb">
				<tr>
					<td style="background-color:###listgetat(variables.color_list,time_allocation_blurb.currentrow)#;" class="label_color">&nbsp;</td>
					<td class="label">#project_name#</td>
					<td style="text-align:right;" class="data">#decimalformat(project_hours)#</td>
				</tr>
			</cfloop>
			</tbody>
		</table>
	</div>
<cfelse>
	You have not yet entered any time for #monthasstring(month(now()))#.
</cfif>
</div>
</cfoutput>