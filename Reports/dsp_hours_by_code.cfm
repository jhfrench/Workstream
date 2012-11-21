
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
<div class="row-fluid">
	<div class="span4">
		<table id="hours_by_code" class="table table-striped table-bordered table-condensed pieChart">
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
					<td class="graph_label">#clientname#</td>
					<td class="graph_data">#numberformat(hours)#</td>
				</tr>
			</cfloop>
			</tbody>
		</table>
	</div>
	<div class="span8">
		<canvas id="hours_by_code_canvas" width="300" height="250" style="cursor:pointer;">
			Your browser does not support canvas, a basic <a href="http://www.html5rocks.com">HTML5</a> feature.
		</canvas>
	</div>
</div>
</cfoutput>