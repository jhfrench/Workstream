
<!--Customers/dsp_customers_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the row of the customers screen, I provide managers with a link to edit the customer and allow a drill down to view any engagements below the customer level, if any exist.

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
	<cfoutput query="get_customers">
		<tr>
			<td>
				<a href="<cfif Get_customers.drill>javascript:customer('#clientcode#')<cfelse>##</cfif>" title="View projects for #clientname#."><cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
					#clientcode# - #clientname#
				<cfelse>
					#clientname# (#clientcode#)
				</cfif></a>
			</td>
			<td>
					#active#
			</td>
			<td align="center">
					<a href="javascript:edit('#customer_id#')" class="btn btn-mini">Edit</a>
			</td>
		</tr>
	</cfoutput>
	</tbody>
</table>