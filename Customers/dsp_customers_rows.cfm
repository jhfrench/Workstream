
<!--Customers/dsp_customers_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the row of the customers screen, I provide managers with a link to edit the customer and allow a drill down to view any engagements below the customer level, if any exist.

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:45:36  daugherty
	Initial revision

	Revision 1.2  2001-11-01 12:04:03-05  french
	Verifying that customer_edit is used correctly as a boolean.

	Revision 1.1  2001-10-11 10:56:36-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||	 
		END FUSEDOC --->
<cfoutput query="get_customers">
	<tr<cfif (currentrow MOD 2) EQ 0> bgcolor="##E1E1E1"</cfif>>
		<td class="RegText#session.workstream_text_size#">
			<cfif Get_customers.drill><a href="javascript:customer('#clientcode#')" class="RegText#session.workstream_text_size#"></cfif>
			<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
				#clientcode# - #clientname#
			<cfelse>
				#clientname# (#clientcode#)
			</cfif>
			<cfif Get_customers.drill></a></cfif>
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			<cfif Get_customers.drill><a href="javascript:customer('#clientcode#')" class="RegText#session.workstream_text_size#"></cfif>
				#active#
			<cfif Get_customers.drill></a></cfif>
		</td>
		<cfif session.workstream_customer_edit>
		<td align="center" class="RegText#session.workstream_text_size#">
				<a href="javascript:edit('#customers_id#')" class="RegText#session.workstream_text_size#">Edit</a>
		</td>
		</cfif>
	</tr>
</cfoutput>

