
<!--Customers/dsp_new_project_step3.cfm
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
<cfinclude template="qry_get_user_field_types.cfm">
<cfoutput>

<fieldset>
	<legend><h3>Custom Fields</h3></legend>
	<cfinclude template="dsp_user_field_labels.cfm">
</fieldset>
	<div class="form-actions">
		<input type="hidden" name="step" value="4" />
		<input type="hidden" name="billable_type_id" value="#attributes.billable_type_id#" />
		<input type="hidden" name="budget" value="#attributes.budget#" />
		<input type="hidden" name="business_case" value="#attributes.business_case#" />
		<input type="hidden" name="customer_id" value="#attributes.customer_id#" />
		<input type="hidden" name="description" value="#attributes.description#" />
		<input type="hidden" name="last_loaded" value="#now()#" />
		<input type="hidden" name="mission" value="#attributes.mission#" />
		<input type="hidden" name="product_id" value="#attributes.product_id#" />
		<input type="hidden" name="project_end" value="#attributes.project_end#" />
		<input type="hidden" name="project_start" value="#attributes.project_start#" />
		<input type="hidden" name="req_custom" value="#attributes.req_custom#" />
		<input type="hidden" name="strip_trailing_ind" value="#attributes.strip_trailing_ind#" />
		<cfif isdefined("attributes.company_id")><input type="hidden" name="company_id" value="#attributes.company_id#" /></cfif>
		<input type="hidden" name="vision" value="#attributes.vision#" />
		<cfswitch expression="#attributes.billable_type_id#">
		<cfcase value="1">
		<input type="hidden" name="end_date" value="#attributes.end_date#" />
		<input type="hidden" name="start_date" value="#attributes.start_date#" />
		<input type="hidden" name="rate" value="#attributes.rate#" />
		</cfcase>
		<cfcase value="3">
		<input type="hidden" name="end_date" value="#attributes.end_date#" />
		<input type="hidden" name="start_date" value="#attributes.start_date#" />
		<input type="hidden" name="months" value="#attributes.months#" />
		</cfcase>
		<cfcase value="4">
		<input type="hidden" name="charge" value="#attributes.charge#" />
		</cfcase>
		</cfswitch>
		<cfif attributes.req_custom NEQ 0>
		<cfloop query="get_user_field_types"><input type="hidden" name="field#user_field_type_id#" value="#evaluate('attributes.field#user_field_type_id#')#" /></cfloop>
		</cfif>
		<input type="submit" value="Proceed" class="btn btn-primary" />
	</div>
</cfoutput>
