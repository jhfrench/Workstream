
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
	--> application.application_specific_settings.color_list: list of hexadecimal color values
	--> project_hours: number of hours spent on a particular project
	--> project_name: name of the project
	END FUSEDOC --->
</cfsilent>

<script type="text/javascript">
	//if Modernizr determines they can be supported, load the following JavaScript resources
	Modernizr.load([
		{
			test: Modernizr.canvas,
			nope: 'common_files/js/excanvas.js',
			complete: function () {
				Modernizr.load('common_files/js/pieChart.jQuery.js');
			}
		}
	]);
</script>
<cfoutput>
<section id="blurb_project" class="span7">
	<h2>Work Allocation</h2>
<cfif time_allocation_blurb.recordcount>
	<p>So far this month you have worked on #time_allocation_blurb.recordcount# <cfif time_allocation_blurb.recordcount EQ 1>project<cfelse>different projects</cfif>. You have spent none of your time on ADMIN/PLANNING. This is under the ADMIN/PLANNING work allocation target of 10% or less. You allocated your time as follows:</p>
	<div class="row-fluid">
		<div class="span4">
			<table id="work_allocation" class="table table-striped table-bordered table-condensed pieChart">
				<caption><h4>#monthasstring(month(now()))# Hours Per Project</h4></caption>
				<thead>
					<tr>
						<th colspan="2" scope="col" title="label">Project</th><th scope="col">Hours</th>
					</tr>
				</thead>
				<tbody style="cursor: pointer;">
				<cfloop query="time_allocation_blurb">
					<tr>
						<td style="background-color:###listgetat(application.application_specific_settings.color_list,time_allocation_blurb.currentrow)#;" class="graph_label_color">&nbsp;</td>
						<td class="graph_label">#project_name#</td>
						<td class="graph_data">#decimalformat(project_hours)#</td>
					</tr>
				</cfloop>
				</tbody>
			</table>
		</div>
		<div class="span8">
			<canvas id="work_allocation_canvas" width="300" height="250" style="cursor:pointer;">
				Your browser does not support canvas, a basic <a href="http://www.html5rocks.com">HTML5</a> feature.
			</canvas>
		</div>
	</div>
<cfelse>
	<p>You have not yet entered any time for #monthasstring(month(now()))#.</p>
</cfif>
</section>
</cfoutput>
