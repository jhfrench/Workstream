

<!--marketing/dsp_marketing_report.cfm
	Author: Jeromy F  -->
    <cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I display the marketing table.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
	</cfsilent>

	<table align="center" border="1" width="95%" cellpadding="3" cellspacing="0">
		<tr class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<td>	Project code</td>
			<td>	Project Name</td>
			<td>	Last Task	</td>
			<td>	Date of Last Task</td>
			<td>	Above Date</td>
			<td>	In Date</td>
			<td>	Best Few Date</td>
			<td>	Contract Date</td>
			<td>	Overview</td>
			<td>	Active</td>
			<td>	Company Size</td>
			<cfloop from="1" to="#get_contact_count.loop_count#" index="ii">
				<td>	Name	</td>
				<td>	Last Name	</td>
				<td>	Phone</td>
				<td>	Extension</td>
				<td>	Address 1</td>
				<td>	Address 2</td>
				<td>	City	</td>
				<td>	State</td>
				<td>	Zip</td>
			</cfloop>
			<td>	Source</td>
			<td>	Projected Revenue</td>
			<td>	Probability</td>
		</tr>
		<cfoutput query="marketing" group="project_id">
			<tr class="RegText#session.workstream_text_size#">
				<td>	<a href="javascript:drill_down('#project_id#');">#project_code#</a>&nbsp;</td>
				<td><a href="javascript:drill_down('#project_id#');">#Description#</a>&nbsp;</td>
				<td>	<a href="javascript:drill_down('#project_id#');">#last_task#</a>&nbsp;</td>
				<td>	<a href="javascript:drill_down('#project_id#');">#dateFormat(date, 'mm/dd/yyyy')#</a>&nbsp;</td>
				<td>	<a href="javascript:drill_down('#project_id#');">#dateFormat(statusabovedate, 'mm/dd/yyyy')#</a>&nbsp;</td>
				<td>	<a href="javascript:drill_down('#project_id#');">#dateFormat(statusindate, 'mm/dd/yyyy')#</a>&nbsp;</td>
				<td>	<a href="javascript:drill_down('#project_id#');">#dateFormat(statusbestfewdate, 'mm/dd/yyyy')#</a>&nbsp;</td>
				<td><a href="javascript:drill_down('#project_id#');">	#dateFormat(statuscontractdate, 'mm/dd/yyyy')#</a>&nbsp;</td>
				<td><a href="javascript:drill_down('#project_id#');">	#overview#</a>&nbsp;</td>
				<td><a href="javascript:drill_down('#project_id#');">	#active_ind#</td>
				<td><a href="javascript:drill_down('#project_id#');">	#company_size#</a>&nbsp;</td>
				<cfset counter =1>
				<cfoutput>
					<td><a href="javascript:drill_down('#project_id#');">	#name#</a>&nbsp;</td>
					<td><a href="javascript:drill_down('#project_id#');">	#lname#</a>&nbsp;</td>
					<td>	<a href="javascript:drill_down('#project_id#');">#Phone#</a>&nbsp;</td>
					<td>	<a href="javascript:drill_down('#project_id#');">#extension#</a>&nbsp;</td>
					<td><a href="javascript:drill_down('#project_id#');">	#address1#</a>&nbsp;</td>
					<td><a href="javascript:drill_down('#project_id#');">	#address2#</a>&nbsp;</td>
					<td><a href="javascript:drill_down('#project_id#');">	#city#</a>&nbsp;</td>
					<td>	<a href="javascript:drill_down('#project_id#');">#state#</a>&nbsp;</td>
					<td>	<a href="javascript:drill_down('#project_id#');">#zip#</a>&nbsp;</td>
					<cfset counter=counter+1>
				</cfoutput>
				<cfloop from="#counter#" to="#get_contact_count.loop_count#" index="ii">
						<td> &nbsp;</td>
						<td> &nbsp;</td>
						<td> &nbsp;</td>
						<td> &nbsp;</td>
						<td> &nbsp;</td>
						<td> &nbsp;</td>
						<td> &nbsp;</td>
						<td> &nbsp;</td>
						<td> &nbsp;</td>
				</cfloop>
				<td><a href="javascript:drill_down('#project_id#');">	#source#</a>&nbsp;</td>
				<td><a href="javascript:drill_down('#project_id#');">	#projected_revenue#</a>&nbsp;</td>
				<td>	<a href="javascript:drill_down('#project_id#');">#probability#</a>&nbsp;</td>
			</tr>
		</cfoutput>
	</table>