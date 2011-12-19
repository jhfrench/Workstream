
<!--Customers/dsp_customers_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the header for the table of customers.

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:45:37  daugherty
	Initial revision

	Revision 1.2  2001-11-01 12:04:03-05  french
	Verifying that customer_edit is used correctly as a boolean.

	Revision 1.1  2001-10-11 10:56:37-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfif session.workstream_customer_edit>
	<cfset variables.row_colspan=2>
<cfelse>
	<cfset variables.row_colspan=1>
</cfif>
</cfsilent>
<cfoutput>
	<tr bgcolor="##008000">	      
	   <form name="inactive" action="index.cfm?fuseaction=customers" method="post">
	   	<td colspan="1" class="HeadText#session.workstream_text_size#White">
			Customer List
	   	</td>
		<td align="right" colspan="#variables.row_colspan#" class="RegText#session.workstream_text_size#White">
			<label for="inactive"><input type="checkbox" name="inactive" id="inactive" onClick="submit();" value="<cfif compare(attributes.inactive, 0)>0<cfelse>1</cfif>" class="RegText#session.workstream_text_size#White"> View <cfif compare(attributes.inactive, 0)>Only Active<cfelse>Inactive</cfif> Customers</label>
		</td>
	   </form>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td class="SubHeadText#session.workstream_text_size#">
			<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Root Code - Customer Name<cfelse>Customer Name (Root Code)</cfif>
		</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Status
		</td>			
		<cfif session.workstream_customer_edit>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Edit
		</td>
		</cfif>
	</tr>
</cfoutput>

