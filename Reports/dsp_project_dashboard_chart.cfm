
<!--Reports/dsp_project_dashboard_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the project list dashboard and a form for restricting and sorting the records.
	I am used to give a overview of all projects or select engagments as selected on the form I display.
	The form has the following option restriction can be placed on Customer and IE.
	Sorting can be done on any column.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>

<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Project Dashboard</h2></caption>
	<thead>
		<tr>
			<th>Customer &amp; Project Name</th>
			<th title="Date the project is to go live, or end (if known).">Due</th>
			<th>Health</th>
			<th>Progress</th>
			<th>Project Update</th>
			<th>Budgeted</th>
			<th>Invoiced</th>
			<th>Upselling Opportunities</th>
			<th><abbr title="Project Manager">PM</abbr></th>
			<th>Open Tasks</th>
			<th>Updated</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_project_dashboard">
		<tr>
			<td id="#project_id#">
				<a href="javascript:edit_project(#project_id#,1);" title="Edit this project's main details">#customer_description#&ndash;#description# (#project_code#)</a>
			</td>
			<td class="date">
				<cfif isdate(deadline_date)>
					#dateformat(deadline_date,'m/d/yyyy')#
				</cfif>
			</td>
			<td>
				<span class="badge badge-#badge#"><i class="icon-#icon# icon-white"></i></span> #project_health#
			</td>
			<td>
				#project_status#
			</td>
			<td>
				#vision#
			</td>
			<td class="number">
				<a href="javascript:edit_project(#project_id#,2);" title="Edit this project's billing details">
					&##36;#numberformat(budget,'___,___,___,___')#
					<cfif loe GT 0><small>#LOE#<abbr title="estimated hours">h</abbr></small></cfif>
				</a>
			</td>
			<td class="number">
				<a href="javascript:edit_project(#project_id#,2);" title="Edit this project's billing details">
					&##36;<cfif len(total_bill_amount)>#numberformat(total_bill_amount,'___,___,___,___')#<cfelse>0</cfif>
				</a>
			</td>
			<td>
				#mission#
			</td>
			<td>
				#last_name#
			</td>
			<td class="number">
				<a href="javascript:account_status(#project_id#);" title="View active related tasks">
					#task_count#
				</a>
			</td>
			<td class="date">
				#dateformat(date_updated, "m/d/yyyy")#
			</td>
		</tr>
	</cfoutput>
	</tbody>
</table>