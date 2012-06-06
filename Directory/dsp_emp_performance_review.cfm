
<!--Directory/dsp_emp_performance_review.cfm
	Author: Damon S -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display an employee's performance review info.
	||
	Name: Damon Scott
	||
	Edits:
$Log:

	||
	END FUSEDOC --->
</cfsilent>
			<cfoutput>
			<span class="SubHeadText">Performance Review Info <a href="##" onclick="window.open('index.cfm?fuseaction=Directory.review_entry&emp_id=#attributes.emp_id#', 'Performance', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,copyhistory=0,width=420,height=175');">ADD</a></span><br />
			<table>
			<tr>
				<td width="25%">Date</td>
				<td width="25%">Reviewer</td>
				<td width="25%">Rating</td>
			</tr>
			</cfoutput>
			<cfoutput query="get_emp_performance_review_info">
				<tr>
					<td>#dateformat(date_reviewed,'mm/dd/yyyy')#</td>
					<td>#lname#, #f_init#</td>
					<td>#rating#</td>
				</tr>
			</cfoutput>
			</table>


