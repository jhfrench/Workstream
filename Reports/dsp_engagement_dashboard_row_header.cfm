
<!--Reports/dsp_engagements_row_header.cfm
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
<cfset today = now()>
</cfsilent>
<cfoutput>
<form name="inactive" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
	<tr>
		<td colspan="8">
			<table cellpadding="0" cellspacing="0" width="124%">
				<tr bgcolor="##008080">
					<td class="HeadTextWhite">
						Project Dashboard - #dateformat(today,'mm/dd/yy')#
					</td>
					<td class="HeadTextWhite">
							<a href="index.cfm?fuseaction=Customers.new_engagement">Add New Project</a>
					</td>
					<td align="right" class="HeadTextWhite" >
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
		<td colspan="2" bgcolor="##c0c0c0" class="SubHeadText">
			Customer & Project Name 
		</td>
<td bgcolor="##c0c0c0" class="SubHeadText">
			IE
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Due Date
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Progress
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Status
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Project Update
		</td>			
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Revenue
		</td>
				<td bgcolor="##c0c0c0" class="SubHeadText">
			Upselling<br />Opportunities
		</td>
						<td bgcolor="##c0c0c0" class="SubHeadText">
			Date Last<br />Updated
		</td>
	</tr>
</cfoutput>
