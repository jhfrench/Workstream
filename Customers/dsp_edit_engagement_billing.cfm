
<!--Customers/dsp_edit_engagement_billing.cfm
	Author: Jeromy French  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the list of details that a user can edit on an engagement.
	||
	Name: Jeromy F
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfset variables.start=1>
</cfsilent>
<cfparam name="engagement_dashboard_Return" default="0">
<cfparam name="IE_Emp_ID_Filter" default="All">
<cfparam name="customer_id_Filter" default="All">
<cfparam name="Sort" default="Customers.Description,Project.Description">
<cfinclude template="qry_get_engagement_main.cfm">
<cfinclude template="qry_get_billable_types.cfm">
<cfoutput>
<cfform name="edit_engagement_main" action="index.cfm?fuseaction=Customers.edit_engagement" method="post">
	<tr bgcolor="##c0c0c0">
		<td align="center" colspan="2" class="SubHeadText#session.workstream_text_size#">
			Engagement Details
		</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Instructions
		</td>
	</tr>
	<tr valign="top">
		<td class="RegText#session.workstream_text_size#Bd">
			Billing Type<br>
			<cfselect name="billable_type_id" size="4" query="get_billable_types" value="billable_type_id" display="billable_type" selected="#get_engagement_main.billable_type_id#" onchange="javascript:submit();" required="Yes" message="Please specify the billing type for this engagement." class="RegText#session.workstream_text_size#"></cfselect>
		</td>
		<td class="RegText#session.workstream_text_size#Bd">
			Budget<br>
			<span class="RegText#session.workstream_text_size#">$ </span><cfinput type="Text" name="budget" value="#get_engagement_main.budget#" required="Yes" validate="float" message="Please specify a budget." size="6" class="RegText#session.workstream_text_size#"><br>
			LOE<br>
			<span class="RegText#session.workstream_text_size#">h </span><cfinput type="Text" name="loe" value="#get_engagement_main.loe#" required="Yes"  size="6" class="RegText#session.workstream_text_size#">
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>Specify the billing type and total budget, in dollars, for this task.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
<cfswitch expression="#get_engagement_main.billable_type_id#">
<cfcase value="3">
<cfinclude template="qry_get_flat_rate.cfm">
	<tr valign="top">
		<td colspan="2" class="RegText#session.workstream_text_size#">
			Start: <cfinput type="text" name="start_date" value="#DateFormat(get_flat_rate.start_date,"mm/dd/yy")#" required="yes" validate="date" message="Please enter a proper date for which billing is to begin on this engagement." size="8" class="RegText#session.workstream_text_size#"> End: <cfinput type="text" name="end_date" value="#DateFormat(get_flat_rate.end_date,"mm/dd/yy")#" required="yes" validate="date" message="Please enter a proper date for which billing is to end on this engagement." size="8" class="RegText#session.workstream_text_size#"> Months: <cfinput type="text" name="months" value="#get_flat_rate.months#" required="yes" validate="integer" message="Please enter the number of months over which this engagement will be billed to the customer." size="2" class="RegText#session.workstream_text_size#"><br>
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>Provide the dates, and the number of months, for which this engagement will be billed to the customer.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
</cfcase>
<cfcase value="4">
<cfinclude template="qry_get_incident_charge.cfm">
	<tr valign="top">
		<td colspan="2" class="RegText#session.workstream_text_size#">
			Incident Charge: $ <cfinput type="text" name="charge" value="#DecimalFormat(get_incident_charge.charge)#" required="yes" validate="integer" message="Please enter, per incident, the charge to the customer." size="4" class="RegText#session.workstream_text_size#"><br>
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>Specify the per-incident charge that the customer will incur each time a new task is created under this engagement.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
</cfcase>
</cfswitch>
	<tr valign="top">
		<td align="center" colspan="2" class="RegText#session.workstream_text_size#Bd">
			<input type="submit" value="Proceed" class="RegText#session.workstream_text_size#">
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>Click this button when you are ready to submit any changes you have entered.</li>
			</ol>
		</td>
	</tr>
<input type="hidden" name="project_id" value="#attributes.project_id#">
<input type="hidden" name="option" value="2">
<input type="hidden" name="edit" value="1">
<input type="hidden" name="original_billable_type_id" value="#get_engagement_main.billable_type_id#">
<input type="hidden" name="engagement_dashboard_Return" value="#engagement_dashboard_Return#">
<input type="hidden" name="customer_id_FIlter" value="#customer_id_Filter#">
<input type="hidden" name="IE_Emp_ID_FIlter" value="#IE_Emp_ID_Filter#">
<input type="hidden" name="Sort" value="#sort#">
</cfform>
</cfoutput>
