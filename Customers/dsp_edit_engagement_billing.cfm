
<!--Customers/dsp_edit_engagement_billing.cfm
	Author: Jeromy French -->
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
<cfparam name="project_manager_emp_id_Filter" default="All">
<cfparam name="attributes.customer_id" default="0">
<cfparam name="Sort" default="Customer.description,Project.description">
<cfinclude template="qry_get_engagement_main.cfm">
<cfinclude template="../common_files/qry_get_ref_billable_type.cfm">
<cfoutput>
<cfform name="edit_engagement_main" action="index.cfm?fuseaction=Customers.edit_engagement" method="post">
	<tr bgcolor="##c0c0c0">
		<td align="center" colspan="2" class="SubHeadText">
			Project Details
		</td>
		<td align="center" class="SubHeadText">
			Instructions
		</td>
	</tr>
	<tr valign="top">
		<td class="RegTextBd">
			Billing Type<br />
			<cfselect name="billable_type_id" size="4" query="get_ref_billable_type" value="billable_type_id" display="description" selected="#get_engagement_main.billable_type_id#" onchange="javascript:submit();" required="yes" message="Please specify the billing type for this engagement."></cfselect>
		</td>
		<td class="RegTextBd">
			Budget<br />
			<span>$ </span>
			<input type="number" name="budget" id="budget" value="#get_engagement_main.budget#" step="0.01" min="0" required="required" class="span5" /><br />
			LOE<br />
			<span>h </span><cfinput type="text" name="loe" value="#get_engagement_main.loe#" required="yes" size="6">
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="#variables.start#" class="Note">
				<li>Specify the billing type and total budget, in dollars, for this task.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
<cfswitch expression="#get_engagement_main.billable_type_id#">
<cfcase value="3">
<cfinclude template="qry_get_flat_rate.cfm">
	<tr valign="top">
		<td colspan="2">
			Start:
			<input type="date" name="start_date" id="start_date" value="#dateformat(get_flat_rate.rate_start_date,'yyyy-mm-dd')#" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
			End:
			<input type="date" name="end_date" id="end_date" value="#dateformat(get_flat_rate.rate_end_date,'yyyy-mm-dd')#" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="#variables.start#" class="Note">
				<li>Provide the dates for which this engagement will be billed to the customer.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
</cfcase>
<cfcase value="4">
<cfinclude template="qry_get_incident_charge.cfm">
	<tr valign="top">
		<td colspan="2">
			Incident Charge: $
			<input type="number" name="charge" id="charge" value="#decimalformat(get_incident_charge.charge)#" step="1" min="0" max="9999" required="required" class="span5" /><br />
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="#variables.start#" class="Note">
				<li>Specify the per-incident charge that the customer will incur each time a new task is created under this engagement.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
</cfcase>
</cfswitch>
	<tr valign="top">
		<td align="center" colspan="2" class="RegTextBd">
			<input type="submit" value="Proceed">
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="#variables.start#" class="Note">
				<li>Click this button when you are ready to submit any changes you have entered.</li>
			</ol>
		</td>
	</tr>
<input type="hidden" name="project_id" value="#attributes.project_id#">
<input type="hidden" name="option" value="2">
<input type="hidden" name="edit" value="1">
<input type="hidden" name="original_billable_type_id" value="#get_engagement_main.billable_type_id#">
<input type="hidden" name="engagement_dashboard_Return" value="#engagement_dashboard_Return#">
<input type="hidden" name="customer_id" value="#attributes.customer_id#">
<input type="hidden" name="project_manager_emp_id_FIlter" value="#project_manager_emp_id_Filter#">
<input type="hidden" name="Sort" value="#sort#">
</cfform>
</cfoutput>
