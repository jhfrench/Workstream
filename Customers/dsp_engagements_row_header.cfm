
<!--Customers/dsp_engagements_row_header.cfm
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
<thead>
	<tr>
		<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2><th>Project Code</th></cfif>
		<th>Customer Name</th>
		<cfif NOT (isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2)><th>Project Code</th></cfif>
		<th>Billing Type</th>
		<th>Open Tasks</th>
		<th>Active</th>
	</tr>
</thead>
