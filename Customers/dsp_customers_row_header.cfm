
<!--Customers/dsp_customers_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the header for the table of customers.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.row_colspan=2>
</cfsilent>
<cfoutput>
	<tr bgcolor="##008000">	      
	   <form name="inactive" action="index.cfm?fuseaction=Customers.customers" method="post">
	   	<td colspan="1" class="HeadTextWhite">
			Customer List
	   	</td>
		<td align="right" colspan="#variables.row_colspan#" class="RegTextWhite">
			<label for="inactive"><input type="checkbox" name="inactive" id="inactive" onclick="submit();" value="<cfif compare(attributes.inactive, 0)>0<cfelse>1</cfif>" class="RegTextWhite"> View <cfif compare(attributes.inactive, 0)>Only Active<cfelse>Inactive</cfif> Customers</label>
		</td>
	   </form>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td class="SubHeadText">
			<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Root Code - Customer Name<cfelse>Customer Name (Root Code)</cfif>
		</td>
		<td align="center" class="SubHeadText">
			Status
		</td>			
		<td align="center" class="SubHeadText">
			Edit
		</td>
	</tr>
</cfoutput>

