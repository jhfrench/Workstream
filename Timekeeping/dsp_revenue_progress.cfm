
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
<div id="revenue_progress">
	<ul id="revenue_progress_tab" class="nav nav-tabs">
		<li><a href="#container_revenue_graph" data-toggle="tab">Graph</a></li>
		<li class="active"><a href="#container_revenue_table" data-toggle="tab">Data</a></li>
	</ul>
	<div id="revenue_progress_tab_content" class="tab-content">
		<div id="container_revenue_graph" class="tab-pane fade">
			<div id="revenue_graph" style="height: 145px; width: 310px;"></div>
		</div>
		<div id="container_revenue_table" class="tab-pane fade in active">
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
	</div>
</div>

<script type="text/javascript">
//if Modernizr determines they can be supported, load the following CSS and JavaScript resources
Modernizr.load([
	{
		load: [
			'common_files/js/flot/jquery.flot.js'
		],
		complete: function(){
			Modernizr.load([
				{
					load: [
						'common_files/js/flot/jquery.flot.stack.js'
					],
					complete: function(){

					    var series_goal = [
					<cfoutput query="get_revenue_goal">
					        [#fiscal_year#, #revenue_goal#],
					</cfoutput>
							[2080, 0]
					    ];
					    var series_hourly = [
					<cfoutput query="get_revenue_goal">
					        [#fiscal_year#, #hourly_revenue#],
					</cfoutput>
							[0, 0]
					    ];
					    var series_flat = [
					<cfoutput query="get_revenue_goal">
					        [#fiscal_year#, #flat_revenue#],
					</cfoutput>
							[0, 0]
					    ];
					    var series_incident = [
					<cfoutput query="get_revenue_goal">
					        [#fiscal_year#, #incident_revenue#],
					</cfoutput>
							[0, 0]
					    ];

					    $.plot(
						    $("#revenue_graph"),
						    [
							    {
							        color: "orange",
							        data: series_goal,
							        lines: {
							            show: true
							        },
							        stack: null
							    },
							    {
							        color: "#7CC37C",
							        data: series_hourly,
							        bars: {
							            show: true,
							            barWidth: 0.3,
							            align: "center"
							        }
							    },
							    {
							        color: "#468847",
							        data: series_flat,
							        bars: {
							            show: true,
							            barWidth: 0.3,
							            align: "center"
							        },
							    },
							    {
							        color: "#416641",
							        data: series_incident,
							        bars: {
							            show: true,
							            barWidth: 0.3,
							            align: "center"
							        },
							    }
						    ],
						    {
						        series: {
						            stack: true
						        },
						        xaxis: {
						            reserveSpace: false,
						        <cfoutput>
						            min: #get_revenue_goal.fiscal_year-0.5#,
						            max: #listlast(valuelist(get_revenue_goal.fiscal_year))#.5,
								</cfoutput>
						            autoscaleMargin: 1,
						            tickDecimals: 0
						        }
						    }
					    );

						//size graph container and graph to match table container and table
						console.log('table container height1: '+$('#container_revenue_table').height());
					    $('#container_revenue_graph').height( $('#container_revenue_table').height() );
						console.log('table container height2: '+$('#container_revenue_table').height());
					    $('#revenue_graph').height( $('#revenue_table').height() ).width( $('#revenue_table').width()-6 );
					    //only after we've set sizes, we can show graph/hide table
					    $('#revenue_progress_tab a:first').tab('show');
					}
				}
			]);
		}
	}
]);
</script>