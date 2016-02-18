
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
<cfoutput>
<section id="blurb_project" class="span7">
	<h2>Work Allocation</h2>
<cfif get_time_allocation_blurb.recordcount>
	<style>
		i.graph_label_color {
			width: 12px;
			height: 12px;
			display: inline-block;
			margin-right: 5px;
		}
	</style>
	<p>So far this month you have worked on #get_time_allocation_blurb.recordcount# <cfif get_time_allocation_blurb.recordcount EQ 1>project<cfelse>different projects</cfif>. You have spent none of your time on ADMIN/PLANNING. This is under the ADMIN/PLANNING work allocation target of 10% or less. You allocated your time as follows:</p>
	<div class="row-fluid">
		<div class="span6">
			<table id="work_allocation" class="table table-striped table-bordered table-condensed table-to-chart" data-chart-type="pie"><!--- $issue$ need to enhance Highcharts to read DOM attributes --->
				<caption><h4>#monthasstring(month(now()))# Hours Per Project</h4></caption>
				<thead>
					<tr>
						<th scope="col" title="label">Project</th>
						<th scope="col">Hours</th>
					</tr>
				</thead>
				<tbody style="cursor: pointer;">
				<cfloop query="get_time_allocation_blurb">
					<tr>
						<td class="graph_label"><i style="background-color:###listgetat(application.application_specific_settings.color_list,get_time_allocation_blurb.currentrow)#;" class="graph_label_color"></i>#project_name#</td>
						<td class="graph_data">#decimalformat(project_hours)#</td>
					</tr>
				</cfloop>
				</tbody>
			</table>
		</div>
		<div class="span6">
			<div id="work_allocation_chart">
			</div>
		</div>
		<script type="text/javascript">
		var $work_allocation_chart,
			color_counter=0,
			series_data=new Array(),
			$work_allocation;

		$(function() {
			$work_allocation=$('##work_allocation');
			
			$work_allocation.find('tbody').find('tr').each(function(){
				var series_data_ii = new Object(),
				$this=$(this);

				/* map table's coloring to Highcharts */
				Highcharts.getOptions().colors.splice(color_counter, 0, $this.find('.graph_label_color').css('background-color'));
				color_counter+=1;

				/* extract pis slice name and value from table */
				series_data_ii.name = $this.find('td.graph_label').html();
				series_data_ii.y = parseFloat($this.find('td.graph_data').text());
				series_data.push(series_data_ii);
			});

			// Radialize the colors
			Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function(color) {
				return {
					radialGradient: {
						cx: 0.5,
						cy: 0.3,
						r: 0.7
					},
					stops: [
						[0, color],
						[1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
					]
				};
			});

			// Build the chart
			$work_allocation_chart = $('##work_allocation_chart').height( Math.max($work_allocation.height(), 250)  ).highcharts({
				chart: {
					plotBackgroundColor: null,
					plotBorderWidth: null,
					plotShadow: false,
					type: 'pie'
				},
				credits: {
					enabled: false
				},
				legend: {
					enabled: false
				},
				title: {
					text: null
				},
				tooltip: {
					pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
				},
				plotOptions: {
					pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						dataLabels: {
							enabled: false
						}
					}
				},
				series: [{
					data: series_data
				}]
			});
		});
		</script>
	</div>
<cfelse>
	<p>You have not yet entered any time for #monthasstring(month(now()))#.</p>
</cfif>
</section>
</cfoutput>
