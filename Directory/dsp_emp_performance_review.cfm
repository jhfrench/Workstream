
<!--Directory/dsp_emp_performance_review.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display an employee's performance review info.
	||
	Name: Jeromy French
	||
	Edits:
$Log:

	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput><h4>Performance Review Info <a href="##" onclick="window.open('index.cfm?fuseaction=Directory.review_entry&emp_id=#attributes.emp_id#', 'Performance', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,copyhistory=0,width=420,height=175');" class="btn btn-mini">ADD</a></h4></cfoutput>
<table class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>Date</th>
			<th>Rating</th>
			<th>Reviewer</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_emp_performance_review_info">
		<tr>
			<td class="date">#dateformat(date_reviewed,'mm/dd/yyyy')#</td>
			<td>#rating#</td>
			<td>#lname#, #left(name, 3)#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>