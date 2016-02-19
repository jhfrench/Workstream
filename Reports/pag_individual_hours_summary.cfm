
<!--Reports/pag_individual_hours_summary.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the a month's hours aggregated by project and week.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfparam name="attributes.report_month" default="#month(dateadd('m',-1, now()))#">
<cfparam name="attributes.report_year" default="#year(dateadd('m',-1, now()))#">
<cfparam name="attributes.user_account_id" default="#variables.user_identification#">
</cfsilent>
<cfinclude template="../common_files/qry_get_employee_details.cfm">
<cfinclude template="qry_get_individual_hours_summary.cfm">

<h2>Hours Report Summary <small><cfoutput>#get_employee_details.last_name#, #get_employee_details.first_name#; #monthasstring(attributes.report_month)# #attributes.report_year#</cfoutput></small></h2>
<cfinclude template="dsp_personal_summary_by_code.cfm">
<cfinclude template="dsp_personal_summary_by_week.cfm">

<cfoutput>
<cfform name="personal_summary" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="well form-inline">
	<label for="report_month">Month</label>
	<select name="report_month" id="report_month">
	<cfloop from="1" to="12" index="variables.month_ii">
		<option value="#variables.month_ii#"<cfif attributes.report_month EQ variables.month_ii> selected="selected"</cfif>>#monthasstring(variables.month_ii)#</option>
	</cfloop>
	</select>
	<label for="report_year">Year</label>
	<select name="report_year" id="report_year">
		<cfloop from="#year(application.application_specific_settings.workstream_start_date)#" to="#year(now())#" index="variables.year_ii">
		<option value="#variables.year_ii#"<cfif attributes.report_year EQ variables.year_ii> selected="selected"</cfif>>#variables.year_ii#</option>
		</cfloop>
	</select>
	<label for="user_account_id">Employee</label>
	<cfmodule template="../common_files/dsp_team_select.cfm" onchange="" user_account_id="">
	<input type="submit" value="Update Report" class="btn btn-primary" />
</cfform>
</cfoutput>

<script type="text/javascript">
var color_counter=0,
	series_data=new Array(),
	$source_data_table,
	$source_data_table_ii;

$(function() {
	$source_data_table=$('table.table-to-chart');

	$source_data_table.each(function(){
		$source_data_table_ii=$(this);
		color_counter=0;
		series_data=new Array();
		
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
		
		var plot_options = new Object();
		plot_options[$source_data_table_ii.attr('data-chart-type')] = {
					allowPointSelect: true,
					cursor: 'pointer',
					dataLabels: {
						enabled: false
					}
				};

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
		$('#'+$source_data_table_ii.attr('data-chart-target'))
			.attr('aria-labelledby', $source_data_table_ii.prop('id'))
			.height( Math.max($source_data_table_ii.height(), 250)  )
			.highcharts({
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
				plotOptions: plot_options,
				series: [{
					data: series_data
				}]
			});
		
		console.log(plot_options);
		console.log(series_data);
	});
});
</script>