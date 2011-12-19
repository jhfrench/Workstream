
<!--Customers/dsp_engagements_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I contain a one-field form that allows the user to toggle between active and inactive engagements.

	||
	Edits:
	$Log$
	Revision 1.1  2006/03/31 15:34:43  csy
	task 42741 Modified code to include customer name to title

	Revision 1.0  2005-02-15 15:45:47-05  daugherty
	Initial revision

	Revision 1.3  2002-04-09 09:48:37-04  french
	Minor HTML formatting.

	Revision 1.2  2001-11-01 12:04:04-05  french
	Verifying that customer_edit is used correctly as a boolean.

	Revision 1.1  2001-10-11 10:56:32-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->

<cfoutput>
<form name="inactive" action="index.cfm?fuseaction=engagements" method="post">
	<tr bgcolor="##008000">
		<td colspan="<cfif session.workstream_engagement_edit>3<cfelse>2</cfif>" class="HeadText#session.workstream_text_size#White">
			Engagements for #get_engagements.Cust_Description#
			<input type="Hidden" name="client_code" value="#attributes.client_code#">
		</td>
		<td colspan="3" class="RegText#session.workstream_text_size#White">
			<label for="inactive"><input type="Checkbox" name="inactive" id="inactive" onClick="submit();" value="<cfif compare(attributes.inactive, 0)>0<cfelse>1</cfif>"> View <cfif compare(attributes.inactive, 0)>Only Active<cfelse>Inactive</cfif> Engagements</label>
		</td>
	</tr>
</form>
	<tr>
		<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2><td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Engagement Code
		</td></cfif>
		<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Customer Name
		</td>
		<cfif NOT (isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2)><td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Engagement Code
		</td></cfif>
		<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Billing Type
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Open Tasks
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Active
		</td>			
		<cfif session.workstream_engagement_edit><td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Edit
		</td></cfif>
	</tr>
</cfoutput>
