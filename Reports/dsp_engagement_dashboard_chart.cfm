
<!--Reports/dsp_engagement_dashboard_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the engagement list dashboard and a form for restricting and sorting the records. 
	I am used to give a overview of all engagements or select engagments as selected on the form I display.
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
	<cfoutput query="get_engagement_dashboard">
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
					<cfcase value="1">
						<span style="background-image:url('images/bar_7.gif');"><i class="icon-star icon-white"></i></span> Good
					</cfcase>
					<cfcase value="2">
						<span style="background-image:url('images/bar_3.gif');"><i class="icon-flag icon-white"></i></span> Caution
					</cfcase>
					<cfdefaultcase>
						<!--- No status so display a red so I get attention --->
						<span style="background-image:url('images/bar_1.gif');"><i class="icon-fire icon-white"></i></span> Danger
					</cfdefaultcase>
				</cfswitch>
				</a>
			</td>
			<td>
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
				<cfif loe GT 0><br />h #LOE#</cfif>
			</td>
			<td class="number">
				&##36;<cfif len(total_bill_amount)>#numberformat(total_bill_amount,'___,___,___,___')#<cfelse>0</cfif>
			</td>
			<td>
				#mission#&nbsp;
			</td>
			<td>
				#lname#&nbsp;
			</td>
			<td class="date">
				#dateformat(date_updated, "m/d/yyyy")#
			</td>
		</tr>
	</cfoutput>
	</tbody>
</table>