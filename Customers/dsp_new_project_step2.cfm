
<!--Customers/dsp_new_project_step2.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the second step of the 'create new project' wizard.
	||
	Name: Jeromy French
	 || 
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.start=1>
</cfsilent>
<cfoutput>
<input type="hidden" name="step" value="3">
	<tr bgcolor="##c0c0c0">
		<td align="center" colspan="1" class="SubHeadText">
			Project Details
		</td>
		<td align="center" class="SubHeadText">
			Instructions
		</td>
	</tr>
	<tr valign="top">
		<td>
			<span class="RegTextBd">Billing Details</span><br />
			Budget: $
			<input type="number" name="budget" id="budget" step="0.01" min="0" required="required" class="span5" />
			<br />
		</td>
		<td width="55%" class="Note">
			<ol type="1" class="Note">
				<li>Specify the total budget, in dollars, for this task.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
<cfswitch expression="#attributes.billable_type_id#">
<cfcase value="1">
	<tr valign="top">
		<td>
			<label for="rate">Hourly rate</label>: $
			<input type="number" name="rate" id="rate" step="0.01" min="0" max="9999" required="required" class="span5" />
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="#variables.start#" class="Note">
				<li>Provide the default hourly rate (you can customize the rate by employee in the Billing_Rate table).</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
	<tr valign="top">
		<td>
			Start:
			<input type="date" name="start_date" id="start_date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
			<p>Please enter a proper date for which billing is to begin on this project.</p>
			End:
			<input type="date" name="end_date" id="end_date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" class="span3 date" />
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="#variables.start#" class="Note">
				<li>Provide the dates for which the hourly rate will be effective.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
</cfcase>
<cfcase value="3">
	<tr valign="top">
		<td>
			Start: 
			<input type="date" name="start_date" id="start_date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
			<p>Please enter a proper date for which billing is to begin on this project.</p>
			End:
			<input type="date" name="end_date" id="end_date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" class="span3 date" />
			Months: 
			<input type="number" name="months" id="months" step="1" min="0" required="required" class="span5" />
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="#variables.start#" class="Note">
				<li>Provide the dates, and the number of months, for which this project will be billed to the customer. Please note that the customer will be billed in equal increments.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
</cfcase>
<cfcase value="4">
	<tr valign="top">
		<td>
			Incident Charge: $ 
			<input type="number" name="charge" id="charge" step="1" min="0" max="9999" required="required" class="span5" /><br />
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="#variables.start#" class="Note">
				<li>Specify the per-incident charge that the customer will incur each time a new task is created under this project.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
</cfcase>
</cfswitch>
	<tr valign="top">
		<td>
			<span class="RegTextBd">Work Dates</span><br />
			Start:
			<input type="date" name="project_start" id="project_start" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
			End: 
			<input type="date" name="project_end" id="project_end" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="#variables.start#" class="Note">
				<li>Provide the date work is to begin on the project, and the anticipated date that work will stop.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
<cfif attributes.req_custom NEQ 0>
	<cfinclude template="dsp_user_field_input.cfm">
</cfif>
	<tr valign="top">
		<td align="center" class="RegTextBd">
			<input type="submit" value="Proceed" />
		</td>
		<td width="55%" class="Note">
			<ol type="1" start="#variables.start#" class="Note">
				<li>Click this button when you are ready to proceed to the next step. The information for this new project will not be stored until the wizard is finished.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
<input type="hidden" name="billable_type_id" value="#attributes.billable_type_id#">
<input type="hidden" name="business_case" value="#attributes.business_case#">
<input type="hidden" name="customer_id" value="#attributes.customer_id#">
<input type="hidden" name="description" value="#attributes.description#">
<input type="hidden" name="mission" value="#attributes.mission#">
<input type="hidden" name="product_id" value="#attributes.product_id#">
<input type="hidden" name="req_custom" value="#attributes.req_custom#">
<cfif isdefined("attributes.strip_trailing")><input type="hidden" name="strip_trailing" value="1"></cfif>
<cfif isdefined("attributes.company_id")><input type="hidden" name="company_id" value="#attributes.company_id#"></cfif>
<input type="hidden" name="vision" value="#attributes.vision#">
</cfoutput>