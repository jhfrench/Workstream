
<!--Reports/dsp_engagement_dashboard_row_header.cfm
	Author: Jeromy F -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I contain a one-field form that allows the user to toggle between active and inactive engagements.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<thead>
	<tr>
		<th>
			Customer &amp; Project Name
		</th>
		<th title="Date the project is to go live, or end (if known).">
			Due
		</th>
		<th>
			Status
		</th>
		<th>
			Progress
		</th>
		<th>
			Project Update
		</th>
		<th>
			Budgeted
		</th>
		<th>
			Invoiced
		</th>
		<th>
			Upselling Opportunities
		</th>
		<th>
			<abbr title="Project Manager">PM</abbr>
		</th>
		<th>
			Updated
		</th>
	</tr>
</thead>
</cfoutput>