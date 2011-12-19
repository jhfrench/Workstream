
<!--Reports/dsp_engagements_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I contain a one-field form that allows the user to toggle between active and inactive engagements.

	||
	Edits:
	$Log$
	Revision 1.5  2006/05/05 22:22:32  csy
	task 44018  Added hidden fields to allow query to remember  custormer and IE filters when choosing "All", "Inactive" or "Active"

	Revision 1.4  2006-04-03 12:45:45-04  csy
	task 42739 Added new engagement link

	Revision 1.3  2006-03-29 14:33:26-05  csy
	task 42737 Modified code to move dropdown to the right

	Revision 1.2  2006-03-28 10:21:11-05  csy
	task 42737  Added a single entry form that will allow users to select and output "Active", "Inactive" or "All"  engagements.

	Revision 1.1  2005-03-09 13:06:17-05  stetzer
	<>

	Revision 1.2  2001-11-01 12:04:04-05  french
	Verifying that customer_edit is used correctly as a boolean.

	Revision 1.1  2001-10-11 10:56:32-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfset today = now()>
</cfsilent>
<cfoutput>
<form name="inactive" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
	<tr>
		<td colspan="8">
			<table cellpadding="0" cellspacing="0" width="124%">
				<tr bgcolor="##008080">
					<td class="HeadText#session.workstream_text_size#White">
						Project Dashboard - #dateformat(today,'mm/dd/yy')#
					</td>
					<td class="HeadText#session.workstream_text_size#White">
							<a href="index.cfm?fuseaction=Customers.new_engagement">Add New Project</a>
					</td>
					<td align="right" class="HeadText#session.workstream_text_size#White" >
						Project view: <select name="inactive" onchange="javascript:document.forms.inactive.submit();">
							<option value="1,2"<cfif NOT comparenocase(attributes.inactive,"1,2")> SELECTED</cfif>>All</option>
							<option value="2"<cfif attributes.inactive EQ 2> SELECTED</cfif>>Active only</option>
							<option value="1"<cfif attributes.inactive EQ 1> SELECTED</cfif>>Inactive only</option>
						</select>
						<cfif isdefined("IE_Emp_ID_Filter") and comparenocase(IE_Emp_ID_Filter, "ALl")>
						<input type="hidden" name="IE_Emp_ID_Filter" value="#IE_Emp_ID_Filter#"></cfif>
                      <cfif isdefined("customer_id_FIlter")and  comparenocase(customer_id_FIlter, "ALl")>
						<input type="hidden" name="customer_id_FIlter" value="#customer_id_FIlter#">
                   </cfif>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</form>
	<tr>
		<td colspan="2" bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Customer & Project Name 
		</td>
<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			IE
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Due Date
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Progress
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Status
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Project Update
		</td>			
		<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Revenue
		</td>
				<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Upselling<br>Opportunities
		</td>
						<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Date Last<br>Updated
		</td>
	</tr>
</cfoutput>
