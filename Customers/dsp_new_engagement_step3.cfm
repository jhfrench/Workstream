
<!--Customers/dsp_new_engagement_step3.cfm
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
<cfinclude template="qry_get_user_field_types.cfm">
<cfoutput>
<input type="hidden" name="step" value="4">
	<tr bgcolor="##c0c0c0">
		<td align="center" colspan="1" class="SubHeadText#session.workstream_text_size#">
			Engagement Details
		</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Instructions
		</td>
	</tr>
<cfinclude template="dsp_user_field_labels.cfm">
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
<input type="hidden" name="billable_id" value="#attributes.billable_id#">
<input type="hidden" name="budget" value="#attributes.budget#">
<input type="hidden" name="business_case" value="#attributes.business_case#">
<input type="hidden" name="customers_id" value="#attributes.customers_id#">
<input type="hidden" name="description" value="#attributes.description#">
<input type="hidden" name="last_loaded" value="#now()#">
<input type="hidden" name="mission" value="#attributes.mission#">
<input type="hidden" name="product_id" value="#attributes.product_id#">
<input type="hidden" name="project_end" value="#attributes.project_end#">
<input type="hidden" name="project_start" value="#attributes.project_start#">
<input type="hidden" name="req_custom" value="#attributes.req_custom#">
<cfif isdefined("attributes.strip_trailing")><input type="hidden" name="strip_trailing" value="1"></cfif>
<cfif isdefined("attributes.visible_to")><input type="hidden" name="visible_to" value="#attributes.visible_to#"></cfif>
<input type="hidden" name="vision" value="#attributes.vision#">
<cfswitch expression="#attributes.billable_id#">
<cfcase value="3">
<input type="hidden" name="end_date" value="#attributes.end_date#">
<input type="hidden" name="start_date" value="#attributes.start_date#">
<input type="hidden" name="months" value="#attributes.months#">
</cfcase>
<cfcase value="4">
<input type="hidden" name="charge" value="#attributes.charge#">
</cfcase>
</cfswitch>
</cfoutput>
<cfif attributes.req_custom NEQ 0>
<cfoutput query="get_user_field_types"><input type="hidden" name="field#type_id#" value="#evaluate("attributes.field#type_id#")#">
</cfoutput>
</cfif>
