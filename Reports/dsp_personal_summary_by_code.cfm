
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
<table id="work_allocation" class="table table-striped table-bordered table-condensed table-to-chart" data-chart-type="pie" data-chart-target="work_allocation_chart">
	<caption><h3>Summary of Hours by Client Code</h3></caption>
	<thead>
		<tr>
			<th colspan="2" title="label">Customer &amp; Project Name</th>
			<th>Hours</th>
		</tr>
	</thead>
	<tbody style="cursor: pointer;">
	<cfoutput query="get_individual_hours_summary_by_client">
		<tr>
			<td class="graph_label"><i style="background-color:###listgetat(application.application_specific_settings.color_list,get_time_allocation_blurb.currentrow)#;" class="graph_label_color"></i>#project_name#</td>
			<td class="graph_data">#decimalformat(hours_worked)#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
	</div>
	<div class="span4">
		<div id="work_allocation_chart">
		</div>
	</div>
</div>