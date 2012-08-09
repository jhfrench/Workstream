
<!--Customers/dsp_engagements_row_header.cfm
	Author: Jeromy F  -->
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
<form name="inactive" action="index.cfm?fuseaction=Customers.engagements" method="post">
	<tr bgcolor="##008000">
		<td colspan="3" class="HeadTextWhite">
			Projects for #get_engagements.Cust_Description#
			<input type="hidden" name="client_code" value="#attributes.client_code#">
		</td>
		<td colspan="3" class="RegTextWhite">
			<label for="active_ind"><input type="checkbox" name="active_ind" id="active_ind" onclick="submit();" value="<cfif compare(attributes.active_ind, 0)>0<cfelse>1</cfif>"> View <cfif compare(attributes.active_ind, 0)>Only Active<cfelse>Inactive</cfif> Projects</label>
		</td>
	</tr>
</form>
	<tr>
		<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2><td bgcolor="##c0c0c0" class="SubHeadText">
			Project Code
		</td></cfif>
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Customer Name
		</td>
		<cfif NOT (isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2)><td bgcolor="##c0c0c0" class="SubHeadText">
			Project Code
		</td></cfif>
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Billing Type
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Open Tasks
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Active
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Edit
		</td>
	</tr>
</cfoutput>
