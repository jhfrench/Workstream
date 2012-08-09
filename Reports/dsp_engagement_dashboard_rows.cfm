
<!--Reports/dsp_engagement_dashboard_rows.cfm
	Author: Jeromy F  -->
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
<cfset today=now()>
</cfsilent>
<tbody>
<cfoutput query="get_engagement_dashboard">
	<tr> 
		<td>
			<a name="#project_id#"></a>
			<a href="javascript:edit_project(#project_id#);" title="Edit this project">
				<!--- Show Status Color Image and SET Status Color Variable baised on the status code--->
				<cfswitch expression="#status#">
					<cfcase value="1">
						<i class="icon-star"></i><img src="images/bar_7.gif" width="16" height="15" border="0" />
					</cfcase>
					<cfcase value="2">
						<i class="icon-flag"></i>
						<img src="images/bar_3.gif" width="16" height="15" border="0" />
					</cfcase>
					<cfdefaultcase>
						<!--- No status so display a red so I get attention --->
						<i class="icon-fire"></i>
						<img src="images/bar_1.gif" width="16" height="15" border="0" />
					</cfdefaultcase>
				</cfswitch>
				#customer_description# - #description#(#project_code#)
			</a>
		</td>
		<td>
			#lname#&nbsp;
		</td>
		<td class="date">
			<cfif isdate(deadline_date)>
				#dateformat(deadline_date,'mm/dd/yy')#
			</cfif>
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
			#numberformat(budget,'$___,___,___,___')#
			<cfif loe GT 0><br />h #LOE#</cfif>
		</td>
		<td class="number">
			<cfif len(total_bill_amount)><a href="index.cfm?fuseaction=Invoice_Posted_List&project_ID_filter=#Project_ID#"> <i>#numberformat(total_bill_amount,'$___,___,___,___')#</i></a><cfelse>$0</cfif>
		</td>
		<td>
			#mission#&nbsp;
		</td>
		<td class="date">
			#dateformat(date_updated, "mm/dd/yy")#
		</td>
	</tr>
</cfoutput>
</tbody>
