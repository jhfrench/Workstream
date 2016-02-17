
<!--Timekeeping/dsp_revenue_progress.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the revenue line/area chart
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
 --->
</cfsilent>
<div id="container_revenue_table">
	<table id="revenue_table" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>year</th>
				<th>goal</th>
				<th>hourly</th>
				<th>flat</th>
				<th>incident</th>
			</tr>
		</thead>
		<tbody>
		<cfoutput query="get_revenue_goal">
			<tr>
				<td class="date">#fiscal_year#</td>
				<td class="number">#revenue_goal#</td>
				<td class="number">#hourly_revenue#</td>
				<td class="number">#flat_revenue#</td>
				<td class="number">#incident_revenue#</td>
			</tr>
		</cfoutput>
		</tbody>
	</table>
</div>

<script type="text/javascript">
var $revenue_table,
	$current_year_revenue,
	previous_years,
	chart_categories = new Array(),
	chart_series = new Array(),
	chart_series_goal = new Array(),
	chart_series_hourly = new Array(),
	chart_series_incident = new Array(),
	chart_series_flat = new Array(),
	chart_series_projected = new Array(),
	current_year_revenue = 0,
	draw_revenue_graph = function() {
		$revenue_table = $('#revenue_table').find('tbody');
		$current_year_revenue = $revenue_table.find('tr:last').find('td.number').filter(':nth-child(1n+3)');
		previous_years = $revenue_table.find('tr').length - 1;
		
		if ($('#container_revenue_table').length) {
			//encapsulate table in Bootstrap tab, add container for graph
			$('#container_revenue_table').addClass('tab-pane fade in active').wrap('<div id="revenue_progress" />')
				.wrap('<div id="revenue_progress_tab_content" class="tab-content" style="overflow: hidden;" />').parent()
				.prepend('<div id="container_revenue_graph" class="tab-pane fade"><div id="revenue_graph" style="height: 145px; width: 310px;"></div></div>').parent()
				.prepend('<ul id="revenue_progress_tab" class="nav nav-tabs" style="margin-bottom: 4px;"><li><a href="#container_revenue_graph" data-toggle="tab" style="line-height:4px;">Graph</a></li><li class="active"><a href="#container_revenue_table" data-toggle="tab" style="line-height: 4px;">Data</a></li></ul>');

			$revenue_table.find('td.date').each(function(index, item) {
				chart_categories[index] = item.innerText;
			});


			$revenue_table.find('td.number')
				.filter(':nth-child(2)').each(function(i) {
					chart_series_goal.push(Number.parseInt($(this).text(), 10));
				}).end()
				.filter(':nth-child(3)').each(function(i) {
					chart_series_hourly.push(Number.parseInt($(this).text(), 10));
				}).end()
				.filter(':nth-child(4)').each(function(i) {
					chart_series_flat.push(Number.parseInt($(this).text(), 10));
				}).end()
				.filter(':nth-child(5)').each(function(i) {
					chart_series_incident.push(Number.parseInt($(this).text(), 10));
				});

			/* Now handle this year's projected revenue */

				/* define 0 for previous years' projected revenue */
				for (var i = 0; i < previous_years; i++) {
					chart_series_projected.push(0);
				};
				/* add up all the types of revenues accrued this year */
				$current_year_revenue.each(function(i) {
					current_year_revenue += parseInt($(this).text(), 10);
				});
				/* project current year's revenue by dividing revenue-to-date by number of day in current year, then multiplying by 365 days, then removing revenue-to-date */
				chart_series_projected.push(Number.parseInt((current_year_revenue / (Math.round((new Date().setHours(23) - new Date(new Date().getYear() + 1900, 0, 1, 0, 0, 0)) / 1000 / 60 / 60 / 24)) * 365) - current_year_revenue, 10));

			chart_series = [
				{
					borderColor: 'rgba(124, 195, 124, 0.70)',
					type: 'column',
					name: 'Projected',
					data: chart_series_projected
				}, {
					borderColor: 'rgba(70, 136, 71, 0.70)',
					type: 'column',
					name: 'Hourly',
					data: chart_series_hourly
				}, {
					borderColor: 'rgba(65, 102, 65, 0.70)',
					type: 'column',
					name: 'Flat',
					data: chart_series_flat
				}, {
					borderColor: 'rgba(220, 245, 220, 0.70)',
					type: 'column',
					name: 'Incident',
					data: chart_series_incident
				}, {
					borderColor: 'rgba(124, 195, 124, 0.70)',
					type: 'line',
					color: '#5A82B5',
					name: 'Goal',
					data: chart_series_goal
				}
			];

			//if Modernizr determines they can be supported, load the following CSS and JavaScript resources
			Modernizr.load([
				{
					load: [
						'//s3.amazonaws.com/external-projects/highcharts/highcharts.js'
					],
					complete: function(){
						draw_revenue_graph_highcharts();
					}
				}
			]);
		} else {
			console.log('cant chart yet');
			draw_revenue_graph();
		};
	},
	draw_revenue_graph_highcharts = function() {
			
		Highcharts.setOptions({
			colors: ['rgba(220, 245, 220, 0.50)', 'rgba(124, 195, 124, 0.50)', 'rgba(70, 136, 71, 0.50)', 'rgba(65, 102, 65, 0.50)']
		});

		//size graph container and graph to match table container and table
		$('#revenue_graph').height($revenue_table.height() + 2).width($revenue_table.width() - 10).css('margin-bottom', '18px')
			.highcharts({
				chart: {
					borderColor: '#000000',
					borderWidth: 2
				},
				credits: {
					enabled: false
				},
				xAxis: {
					categories: chart_categories
				},
				yAxis: {
					max: 30000,
					minorGridLineWidth: 1,
					minorTickInterval: 10000,
					title: {
						enabled: false
					}
				},
				legend: {
					enabled: false
				},
				title: {
					text: null
				},
				plotOptions: {
					column: {
						borderWidth: 2,
						lineWidth: 2,
						stacking: 'normal'
					},
					line: {
							lineWidth: 2,
							shadow: true,
							states: {
								hover: {
									lineWidth: 3
								}
							},
							marker: {
							enabled: false
						}
					}
				},
				series: chart_series
			});
		//only after we've set graph size and painted the graph, we can show graph/hide table
		$('#revenue_progress_tab a:first').tab('show');
		// setTimeout( function(){$('#container_revenue_graph').height( $('#container_revenue_table').height() )}, 400 );
		// setTimeout( function(){$('#container_revenue_graph').height( $('#container_revenue_table').height() )}, 1000 );
	};
</script>