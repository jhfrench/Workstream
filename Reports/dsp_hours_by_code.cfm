
<!--Reports/dsp_hours_by_code.cfm
	Author: Jeromy F -->
	<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>

<cfoutput>
<div class="row-fluid">
	<div class="span6">
		<table id="hours_by_code" class="table table-striped table-bordered table-condensed table-to-chart" data-chart-type="pie" data-chart-target="hours_by_code_chart">
			<caption>
				<h2>#attributes.report_name#</h2>
				<h3>for #attributes.from_date#&nbsp;through&nbsp;#attributes.through_date#</h3>
			</caption>
			<thead>
				<tr>
					<th>Employee Classification</th>
					<th>Project</th>
					<th>Hours</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th colspan="2">Total Hours</th>
					<td class="number">#numberformat(get_hours_by_code_totals.hours_total)#</td>
				</tr>
			</tfoot>
			<tbody>
			<cfloop query="get_hours_by_code">
				<tr>
					<td>#employee_classification#</td>
					<td class="graph_label">#client_name#</td>
					<td class="graph_data">#numberformat(hours)#</td>
				</tr>
			</cfloop>
			</tbody>
		</table>
	</div>
	<div class="span6">
		<div id="hours_by_code_chart">
		</div>
	</div>
</div>
</cfoutput>
<script type="text/javascript">
var $target_chart_element,
	color_counter=0,
	series_data=new Array(),
	$source_data_table;

$(function() {
	$source_data_table=$('table.table-to-chart');

	$source_data_table.find('tbody').find('tr').each(function(){
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
	$target_chart_element = $('#'+$source_data_table.attr('data-chart-target')).height( Math.max($source_data_table.height(), 250)  ).highcharts({
		chart: {
			plotBackgroundColor: null,
			plotBorderWidth: null,
			plotShadow: false,
			type: $source_data_table.attr('data-chart-type')
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
			$source_data_table.attr('data-chart-type'): {
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