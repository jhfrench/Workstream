
<!--Reports/pag_efficiency_report.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the efficiency report for the project that corresponds to what the user requests (as determined by the fuseaction).
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
<cfinclude template="act_efficiency_report.cfm">
<cfset variables.lowest_year=year(now())>
<cfset variables.temp_year=0>
</cfsilent>
<cfinclude template="act_change_month.cfm">
<cfinclude template="act_efficiency_report.cfm">

<cfoutput>
<form name="drill_down" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="well form-inline">
	#variables.project_name# Time for 
	<label for="admin_month">Month</label>: 
	<select name="admin_month" id="" class="span2">
		<cfloop from="1" to="12" index="ii">
		<option value="#ii#"<cfif attributes.admin_month EQ ii> selected="selected"</cfif>>#monthasstring(ii)#</option></cfloop>
	</select>
	<label for="admin_year">Year</label>: 
	<select name="admin_year" id="" class="span2">
		<cfloop from="#variables.lowest_year#" to="#year(now())#" index="ii">
		<option value="#ii#"<cfif attributes.admin_year EQ ii> selected="selected"</cfif>>#ii#</option></cfloop>
	</select>
	<label for="hide_supervisor">
		<input type="checkbox" name="hide_supervisor" id="hide_supervisor" value="1"<cfif isdefined("attributes.hide_supervisor")> checked="checked"</cfif> /> Remove your data
	</label>
	<input type="submit" name="submit" value="Update Report" class="btn btn-primary" />
</form>
</cfoutput>
<cfif get_subordinates.recordcount>
	<cfinclude template="dsp_efficiency_report.cfm">
<cfelse>
	<div class="alert alert-info">
		Your search returned no records.
	</div>
</cfif>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="user_account_id" fuseaction="Directory.employee_details">

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