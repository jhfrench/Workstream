
<!--Customers/dsp_customers_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the row of the customers screen, I provide managers with a link to edit the customer and allow a drill down to view any projects below the customer level, if any exist.

	||
	Edits:
	$Log$
	 ||
		END FUSEDOC --->
</cfsilent>
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Customer List</h2></caption>
	<thead>
	<tr>
		<th>
			<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Root Code - Customer Name<cfelse>Customer Name (Root Code)</cfif>
		</th>
		<th>
			Status
		</th>
		<th>
			Edit
		</th>
	</tr>
	</thead>
	<tbody>
	<cfoutput query="get_customer_details">
		<tr>
			<td>
				<a href="<cfif get_customer_details.drill_ind>javascript:customer(#customer_id#)<cfelse>##</cfif>" title="View projects for #clientname#."><cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
					#root_code# - #clientname#
				<cfelse>
					#clientname# (#root_code#)
				</cfif></a>
			</td>
			<td>
				#active#
			</td>
			<td align="center">
				<a href="javascript:edit(#customer_id#)" class="btn btn-mini">Edit</a>
			</td>
		</tr>
	</cfoutput>
	</tbody>
</table>