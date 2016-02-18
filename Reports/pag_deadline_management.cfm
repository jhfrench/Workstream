
<!--Reports/pag_deadline_management.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Deadline Management Report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.last_month=dateadd("m",-1, now())>
<cfparam name="attributes.admin_month" default="#month(variables.last_month)#">
<cfparam name="attributes.admin_year" default="#year(variables.last_month)#">
<cfset attributes.date_linked=createodbcdate("#attributes.admin_month#/1/#attributes.admin_year#")>
</cfsilent>
<cfinclude template="../common_files/qry_get_subordinates.cfm">
<cfif get_subordinates.recordcount>
	<cfinclude template="../common_files/qry_get_extreme_dates.cfm">
	<cfinclude template="qry_get_deadline_management.cfm">
	<cfinclude template="dsp_deadline_management_form.cfm">
	<div class="row-fluid">
		<div class="span6">
			<cfinclude template="dsp_deadline_management_chart.cfm">
		</div>
		<div class="span6">
			<cfinclude template="dsp_deadline_management_graph.cfm">
		</div>
	</div>
	<div class="row-fluid">
		<div class="span9">
			<cfinclude template="dsp_deadline_management_sub.cfm">
		</div>
	</div>
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="user_account_id" fuseaction="Directory.employee_details">
	<cfif isdefined("attributes.hide_supervisor")>
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="change_month" fuseaction="#attributes.fuseaction#" field_name="admin_month" field2_variable_ind="1" field2_name="admin_year" process_form_ind="1" hide_supervisor="1">
	<cfelse>
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="change_month" fuseaction="#attributes.fuseaction#" field_name="admin_month" field2_variable_ind="1" field2_name="admin_year">
	</cfif>
<cfelse>
<div class="alert alert-info">
	There is no data available for this report. 
</div>
</cfif>

<script type="text/javascript">
var $target_chart_element,
	color_counter=0,
	series_data=new Array(),
	$source_data_table,
	$source_data_table_ii;

$(function() {
	$source_data_table=$('table.table-to-chart');

	$source_data_table.each(function(){
		$source_data_table_ii=$(this);
		
		$source_data_table_ii.find('tbody').find('tr').each(function(){
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
		$('#'+$source_data_table_ii.attr('data-chart-target')).each(function(){})$(this).height( Math.max($source_data_table_ii.height(), 250)  ).highcharts({
			chart: {
				plotBackgroundColor: null,
				plotBorderWidth: null,
				plotShadow: false,
				type: $source_data_table_ii.attr('data-chart-type')
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
				$source_data_table_ii.attr('data-chart-type'): {
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
});
</script>