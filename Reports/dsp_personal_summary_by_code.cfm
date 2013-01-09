
<!--Reports/dsp_personal_summary_by_code.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the a month's hours aggregated by project.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<div class="row-fluid">
	<div class="span8">
<table id="work_allocation" class="table table-striped table-bordered table-condensed pieChart">
	<caption><h3>Summary of Hours by Client Code &amp; Employee</h3></caption>
	<thead>
		<tr>
			<th colspan="2" scope="col" title="label">Customer &amp; Project Name</th>
			<th scope="col">Hours</th>
		</tr>
	</thead>
	<tbody style="cursor: pointer;">
	<cfoutput query="get_individual_hours_summary_by_client">
		<tr>
			<td style="background-color:###listgetat(application.application_specific_settings.color_list,currentrow)#;" class="graph_label_color">&nbsp;</td>
			<td class="graph_label">#project_name#</td>
			<td class="graph_data">#decimalformat(hours_worked)#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
	</div>
	<div class="span4">
		<canvas id="work_allocation_canvas" width="300" height="250" style="cursor:pointer;">
			Your browser does not support canvas, a basic <a href="http://www.html5rocks.com">HTML5</a> feature.
		</canvas>
	</div>
</div>