
<!--Customers/dsp_new_engagement_step2.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the second step of the 'create new engagement' wizard.
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
		<td align="center" colspan="1" class="SubHeadText#session.workstream_text_size#">
			Project Details
		</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Instructions
		</td>
	</tr>
	<tr valign="top">
		<td class="RegText#session.workstream_text_size#">
			<span class="RegText#session.workstream_text_size#Bd">Billing Details</span><br>
			Budget: $<cfinput type="text" name="budget" required="yes" validate="float" message="Please specify a budget (as a number)." size="10" class="RegText#session.workstream_text_size#"><br>
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" class="Note#session.workstream_text_size#">
				<li>Specify the total budget, in dollars, for this task.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
<cfswitch expression="#attributes.billable_type_id#">
<cfcase value="3">
	<tr valign="top">
		<td class="RegText#session.workstream_text_size#">
			Start: <cfinput type="text" name="start_date" required="yes" validate="date" message="Please enter a proper date for which billing is to begin on this engagement." size="8" class="RegText#session.workstream_text_size#"> End: <cfinput type="text" name="end_date" required="no" validate="date" message="Please enter a proper date for which billing is to end on this engagement." size="8" class="RegText#session.workstream_text_size#"> Months: <cfinput type="text" name="months" required="yes" validate="integer" message="Please enter the number of months over which this engagement will be billed to the customer." size="2" class="RegText#session.workstream_text_size#"><br>
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>Provide the dates, and the number of months, for which this engagement will be billed to the customer. Please note that the customer will be billed in equal increments.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
</cfcase>
<cfcase value="4">
	<tr valign="top">
		<td class="RegText#session.workstream_text_size#">
			Incident Charge: $ <cfinput type="text" name="charge" required="yes" validate="integer" message="Please enter, per incident, the charge to the customer." size="4" class="RegText#session.workstream_text_size#"><br>
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
		<td class="RegText#session.workstream_text_size#">
			<span class="RegText#session.workstream_text_size#Bd">Work Dates</span><br>
			Start: <cfinput type="text" name="project_start" required="yes" validate="date" message="Please enter a proper date for which work is to begin on this engagement." size="8" class="RegText#session.workstream_text_size#"> End: <cfinput type="text" name="project_end" required="yes" validate="date" message="Please enter a proper date for which work is to end on this engagement." size="8" class="RegText#session.workstream_text_size#"> <br>
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>Provide the date work is to begin on the project, and the anticipated date that work will stop.</li><cfset variables.start=incrementvalue(variables.start)>
			</ol>
		</td>
	</tr>
<cfif attributes.req_custom NEQ 0>
	<cfinclude template="dsp_user_field_input.cfm">
</cfif>
	<tr valign="top">
		<td align="center" class="RegText#session.workstream_text_size#Bd">
			<input type="submit" value="Proceed" class="RegText#session.workstream_text_size#">
		</td>
		<td width="55%" class="Note#session.workstream_text_size#">
			<ol type="1" start="#variables.start#" class="Note#session.workstream_text_size#">
				<li>Click this button when you are ready to proceed to the next step. The information for this new engagement will not be stored until the wizard is finished.</li><cfset variables.start=incrementvalue(variables.start)>
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
