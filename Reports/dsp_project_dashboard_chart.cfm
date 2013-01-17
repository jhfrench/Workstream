
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
			<th>Status</th>
			<th>Progress</th>
			<th>Project Update</th>
			<th>Budgeted</th>
			<th>Invoiced</th>
			<th>Upselling Opportunities</th>
			<th><abbr title="Project Manager">PM</abbr></th>
			<th>Updated</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_project_dashboard">
		<tr> 
			<td id="#project_id#">
				<a href="javascript:edit_project(#project_id#);" title="Edit this project">#customer_description#&ndash;#description# (#project_code#)</a>
			</td>
			<td class="date">
				<cfif isdate(deadline_date)>
					#dateformat(deadline_date,'m/d/yyyy')#
				</cfif>
			</td>
			<td>
				<a href="javascript:account_status(#project_id#);" title="View active related tasks">
				<!--- Show status color image and set status color variable based on the status code--->
				<cfswitch expression="#status#">
					<cfcase value="0">
						<span class="badge badge-default"><i class="icon-question-sign icon-white"></i></span> Unknown
					</cfcase>
					<cfcase value="1">
						<span class="badge badge-success"><i class="icon-star icon-white"></i></span> Good
					</cfcase>
					<cfcase value="2">
						<span class="badge badge-warning"><i class="icon-flag icon-white"></i></span> Caution
					</cfcase>
					<cfdefaultcase>
						<!--- No status so display a red so I get attention --->
						<span class="badge badge-important"><i class="icon-fire icon-white"></i></span> Danger
					</cfdefaultcase>
				</cfswitch>
				</a>
			</td>
			<td>
				<!--- $issue$: either convert this to REF table, or cfswitch --->
				<cfif eng_status EQ 0>Not Started</cfif>
				<cfif eng_status EQ 1>Approved&ndash;In Progress</cfif>
				<cfif eng_status EQ 11>Technical Review&ndash;Nucleus</cfif>
				<cfif eng_status EQ 12>Technical Review&ndash;Customer</cfif>
				<cfif eng_status EQ 2>Needs Customer Review</cfif>
				<cfif eng_status EQ 3>Reviewed&ndash;Needs Work</cfif>
				<cfif eng_status EQ 9>Sent for Content Approval</cfif>
				<cfif eng_status EQ 10>Approved&ndash;Not Scheduled</cfif>
				<cfif eng_status EQ 8>Getting LOE</cfif>
				<cfif eng_status EQ 7>Sent for Financial Approval</cfif>
				<cfif eng_status EQ 6>Withdrawn</cfif>
				<cfif eng_status EQ 5>On Hold</cfif>
				<cfif eng_status EQ 4>Completed</cfif>
			</td>
			<td>
				#vision#&nbsp;
			</td>
			<td class="number">
				&##36;#numberformat(budget,'___,___,___,___')#
				<cfif loe GT 0><br /><abbr title="estimated hours">h</abbr> #LOE#</cfif>
			</td>
			<td class="number">
				&##36;<cfif len(total_bill_amount)>#numberformat(total_bill_amount,'___,___,___,___')#<cfelse>0</cfif>
			</td>
			<td>
				#mission#&nbsp;
			</td>
			<td>
				#last_name#&nbsp;
			</td>
			<td class="date">
				#dateformat(date_updated, "m/d/yyyy")#
			</td>
		</tr>
	</cfoutput>
	</tbody>
</table>